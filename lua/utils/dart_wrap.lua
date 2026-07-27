local M = {}

local function notify(message, level)
  vim.notify(message, level or vim.log.levels.INFO, { title = "Dart Wrap" })
end

local function find_matching_paren(source, open_pos)
  local depth = 0
  local index = open_pos
  local quote = nil
  local line_comment = false
  local block_comment = false

  while index <= #source do
    local char = source:sub(index, index)
    local next_char = source:sub(index + 1, index + 1)

    if line_comment then
      line_comment = char ~= "\n"
    elseif block_comment then
      if char == "*" and next_char == "/" then
        block_comment = false
        index = index + 1
      end
    elseif quote then
      if char == "\\" then
        index = index + 1
      elseif char == quote then
        quote = nil
      end
    elseif char == "/" and next_char == "/" then
      line_comment = true
      index = index + 1
    elseif char == "/" and next_char == "*" then
      block_comment = true
      index = index + 1
    elseif char == "'" or char == '"' then
      quote = char
    elseif char == "(" then
      depth = depth + 1
    elseif char == ")" then
      depth = depth - 1

      if depth == 0 then
        return index
      end
    end

    index = index + 1
  end
end

local function line_starts(lines)
  local starts = {}
  local offset = 1

  for index, line in ipairs(lines) do
    starts[index] = offset
    offset = offset + #line + 1
  end

  return starts
end

local function abs_to_pos(starts, lines, abs)
  for index = #starts, 1, -1 do
    if abs >= starts[index] then
      return index - 1, math.min(abs - starts[index], #lines[index])
    end
  end

  return 0, 0
end

local function remove_base_indent(lines, base_indent)
  for index = 2, #lines do
    if lines[index]:sub(1, #base_indent) == base_indent then
      lines[index] = lines[index]:sub(#base_indent + 1)
    end
  end
end

local function build_obx_lines(widget_text, base_indent)
  local lines = vim.split(widget_text, "\n", { plain = true })

  remove_base_indent(lines, base_indent)

  local wrapped = {
    "Obx(",
    base_indent .. "  () => " .. lines[1],
  }

  for index = 2, #lines do
    wrapped[#wrapped + 1] = base_indent .. "  " .. lines[index]
  end

  wrapped[#wrapped] = wrapped[#wrapped] .. ","
  wrapped[#wrapped + 1] = base_indent .. ")"

  return wrapped
end

local function find_widget_call(source, cursor_abs)
  local best = nil
  local search_from = 1

  while true do
    local name_start, call_prefix_end = source:find("%f[%a_][A-Z][%w_%.]*%s*%(", search_from)

    if not name_start then
      break
    end

    local name = source:sub(name_start, call_prefix_end):match "^([%a_][%w_%.]*)"
    local last_segment = name and name:match "([%a_][%w_]*)$"
    local open_pos = source:find("(", call_prefix_end, true)
    local end_pos = open_pos and find_matching_paren(source, open_pos)
    local start_pos = name_start
    local before_name = source:sub(1, name_start - 1)
    local const_start = before_name:match ".*()%f[%a_]const%s+$"

    if const_start then
      start_pos = const_start
    end

    if last_segment ~= "Obx" and end_pos and start_pos <= cursor_abs and cursor_abs <= end_pos then
      if not best or (end_pos - start_pos) < (best.end_pos - best.start_pos) then
        best = {
          start_pos = start_pos,
          end_pos = end_pos,
        }
      end
    end

    search_from = name_start + 1
  end

  return best
end

function M.wrap_with_obx()
  local bufnr = vim.api.nvim_get_current_buf()

  if vim.bo[bufnr].filetype ~= "dart" then
    notify("Wrap with Obx hanya aktif untuk file Dart.", vim.log.levels.WARN)
    return
  end

  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local starts = line_starts(lines)
  local cursor = vim.api.nvim_win_get_cursor(0)
  local cursor_abs = starts[cursor[1]] + cursor[2]
  local source = table.concat(lines, "\n")
  local widget = find_widget_call(source, cursor_abs)

  if not widget then
    notify("Tidak menemukan widget Dart di bawah cursor.", vim.log.levels.WARN)
    return
  end

  local start_row, start_col = abs_to_pos(starts, lines, widget.start_pos)
  local end_row, end_col = abs_to_pos(starts, lines, widget.end_pos + 1)
  local base_indent = lines[start_row + 1]:match "^%s*" or ""
  local widget_text = source:sub(widget.start_pos, widget.end_pos)

  vim.api.nvim_buf_set_text(bufnr, start_row, start_col, end_row, end_col, build_obx_lines(widget_text, base_indent))
end

return M
