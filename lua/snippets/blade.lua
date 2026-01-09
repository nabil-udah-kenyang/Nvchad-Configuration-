local ls = require "luasnip"
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

return {
  -- Layout
  s("b:extends", { t "@extends('", i(1, "layout"), t "')" }),
  s("b:yield", { t "@yield('", i(1, "content"), t "')" }),

  s("b:section", {
    t "@section('",
    i(1, "content"),
    t { "')", "" },
    i(2),
    t { "", "@endsection" },
  }),

  -- Condition
  s("b:if", {
    t "@if (",
    i(1, "condition"),
    t { ")", "" },
    i(2),
    t { "", "@endif" },
  }),

  s("b:if-else", {
    t "@if (",
    i(1, "condition"),
    t { ")", "" },
    i(2),
    t { "", "@else", "" },
    i(3),
    t { "", "@endif" },
  }),

  s("b:unless", {
    t "@unless (",
    i(1, "condition"),
    t { ")", "" },
    i(2),
    t { "", "@endunless" },
  }),

  -- Loop
  s("b:foreach", {
    t "@foreach (",
    i(1, "$items"),
    t " as ",
    i(2, "$item"),
    t { ")", "" },
    i(3),
    t { "", "@endforeach" },
  }),

  s("b:forelse", {
    t "@forelse (",
    i(1, "$items"),
    t " as ",
    i(2, "$item"),
    t { ")", "" },
    i(3),
    t { "", "@empty", "" },
    i(4),
    t { "", "@endforelse" },
  }),

  -- Helpers
  s("b:csrf", { t "@csrf" }),
  s("b:method", { t "@method('", i(1, "PUT"), t "')" }),

  -- Echo
  s("b:echo", { t "{{ ", i(1, "$data"), t " }}" }),
  s("b:echo-html", { t "{!! ", i(1, "$html"), t " !!}" }),

  -- =====================
  -- DISPLAY
  -- =====================
  s("d-none", t "d-none"),
  s("d-inline", t "d-inline"),
  s("d-inline-block", t "d-inline-block"),
  s("d-block", t "d-block"),
  s("d-flex", t "d-flex"),
  s("d-inline-flex", t "d-inline-flex"),

  -- =====================
  -- FLEX
  -- =====================
  s("flex-row", t "flex-row"),
  s("flex-column", t "flex-column"),
  s("flex-wrap", t "flex-wrap"),
  s("flex-nowrap", t "flex-nowrap"),
  s("justify-content-start", t "justify-content-start"),
  s("justify-content-center", t "justify-content-center"),
  s("justify-content-end", t "justify-content-end"),
  s("justify-content-between", t "justify-content-between"),
  s("justify-content-around", t "justify-content-around"),
  s("justify-content-evenly", t "justify-content-evenly"),
  s("align-items-start", t "align-items-start"),
  s("align-items-center", t "align-items-center"),
  s("align-items-end", t "align-items-end"),
  s("align-items-stretch", t "align-items-stretch"),

  -- =====================
  -- SPACING (MARGIN)
  -- =====================
  s("m-0", t "m-0"),
  s("m-1", t "m-1"),
  s("m-2", t "m-2"),
  s("m-3", t "m-3"),
  s("m-4", t "m-4"),
  s("m-5", t "m-5"),
  s("mx-auto", t "mx-auto"),
  s("mt-0", t "mt-0"),
  s("mt-1", t "mt-1"),
  s("mt-2", t "mt-2"),
  s("mt-3", t "mt-3"),
  s("mt-4", t "mt-4"),
  s("mt-5", t "mt-5"),
  s("mb-0", t "mb-0"),
  s("mb-1", t "mb-1"),
  s("mb-2", t "mb-2"),
  s("mb-3", t "mb-3"),
  s("mb-4", t "mb-4"),
  s("mb-5", t "mb-5"),

  -- =====================
  -- SPACING (MARGIN START / END)
  -- =====================
  s("ms-0", t "ms-0"),
  s("ms-1", t "ms-1"),
  s("ms-2", t "ms-2"),
  s("ms-3", t "ms-3"),
  s("ms-4", t "ms-4"),
  s("ms-5", t "ms-5"),

  s("me-0", t "me-0"),
  s("me-1", t "me-1"),
  s("me-2", t "me-2"),
  s("me-3", t "me-3"),
  s("me-4", t "me-4"),
  s("me-5", t "me-5"),
  -- =====================
  -- SPACING (PADDING)
  -- =====================
  s("p-0", t "p-0"),
  s("p-1", t "p-1"),
  s("p-2", t "p-2"),
  s("p-3", t "p-3"),
  s("p-4", t "p-4"),
  s("p-5", t "p-5"),
  s("px-1", t "px-1"),
  s("px-2", t "px-2"),
  s("px-3", t "px-3"),
  s("px-4", t "px-4"),
  s("px-5", t "px-5"),
  s("py-1", t "py-1"),
  s("py-2", t "py-2"),
  s("py-3", t "py-3"),
  s("py-4", t "py-4"),
  s("py-5", t "py-5"),

  -- =====================
  -- GRID SYSTEM
  -- =====================
  s("container", t "container"),
  s("container-fluid", t "container-fluid"),
  s("row", t "row"),
  s("col", t "col"),
  s("col-1", t "col-1"),
  s("col-2", t "col-2"),
  s("col-3", t "col-3"),
  s("col-4", t "col-4"),
  s("col-5", t "col-5"),
  s("col-6", t "col-6"),
  s("col-7", t "col-7"),
  s("col-8", t "col-8"),
  s("col-9", t "col-9"),
  s("col-10", t "col-10"),
  s("col-11", t "col-11"),
  s("col-12", t "col-12"),

  s("col-sm-6", t "col-sm-6"),
  s("col-md-6", t "col-md-6"),
  s("col-lg-4", t "col-lg-4"),
  s("col-xl-3", t "col-xl-3"),
  s("col-xxl-2", t "col-xxl-2"),

  -- =====================
  -- TEXT
  -- =====================
  s("text-start", t "text-start"),
  s("text-center", t "text-center"),
  s("text-end", t "text-end"),
  s("fw-bold", t "fw-bold"),
  s("fw-semibold", t "fw-semibold"),
  s("fw-light", t "fw-light"),
  s("fst-italic", t "fst-italic"),

  -- =====================
  -- COLORS
  -- =====================
  s("text-primary", t "text-primary"),
  s("text-secondary", t "text-secondary"),
  s("text-success", t "text-success"),
  s("text-danger", t "text-danger"),
  s("text-warning", t "text-warning"),
  s("text-info", t "text-info"),
  s("text-dark", t "text-dark"),
  s("text-muted", t "text-muted"),

  s("bg-primary", t "bg-primary"),
  s("bg-secondary", t "bg-secondary"),
  s("bg-success", t "bg-success"),
  s("bg-danger", t "bg-danger"),
  s("bg-warning", t "bg-warning"),
  s("bg-info", t "bg-info"),
  s("bg-dark", t "bg-dark"),
  s("bg-light", t "bg-light"),

  -- =====================
  -- BUTTONS
  -- =====================
  s("btn", t "btn"),
  s("btn-primary", t "btn btn-primary"),
  s("btn-secondary", t "btn btn-secondary"),
  s("btn-success", t "btn btn-success"),
  s("btn-danger", t "btn btn-danger"),
  s("btn-warning", t "btn btn-warning"),
  s("btn-info", t "btn btn-info"),
  s("btn-light", t "btn btn-light"),
  s("btn-dark", t "btn btn-dark"),
  s("btn-outline-primary", t "btn btn-outline-primary"),
  s("btn-outline-danger", t "btn btn-outline-danger"),

  -- =====================
  -- COMPONENTS
  -- =====================
  s("card", t "card"),
  s("card-body", t "card-body"),
  s("card-title", t "card-title"),
  s("alert", t "alert"),
  s("alert-primary", t "alert alert-primary"),
  s("alert-success", t "alert alert-success"),
  s("alert-danger", t "alert alert-danger"),
  s("badge", t "badge"),
  s("badge-primary", t "badge bg-primary"),
  s("badge-success", t "badge bg-success"),

  -- =====================
  -- UTILITIES
  -- =====================
  s("shadow", t "shadow"),
  s("shadow-sm", t "shadow-sm"),
  s("shadow-lg", t "shadow-lg"),
  s("rounded", t "rounded"),
  s("rounded-circle", t "rounded-circle"),
  s("rounded-pill", t "rounded-pill"),
}
