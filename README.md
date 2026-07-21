# NvChad Configuration - Nabil

<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/4/4f/Neovim-logo.svg" alt="Neovim" width="220">
</p>

<p align="center">
  Konfigurasi Neovim berbasis NvChad yang dibuat supaya editor terasa cepat, rapi, dan siap dipakai untuk coding harian.
</p>

<p align="center">
  <a href="https://neovim.io/"><img alt="Neovim" src="https://img.shields.io/badge/Editor-Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white"></a>
  <a href="https://nvchad.com/"><img alt="NvChad" src="https://img.shields.io/badge/Framework-NvChad-00A3FF?style=for-the-badge&logo=neovim&logoColor=white"></a>
  <a href="https://www.lua.org/"><img alt="Lua" src="https://img.shields.io/badge/Config-Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white"></a>
  <a href="https://github.com/folke/lazy.nvim"><img alt="lazy.nvim" src="https://img.shields.io/badge/Plugin_Manager-lazy.nvim-7C3AED?style=for-the-badge&logo=lua&logoColor=white"></a>
  <a href="https://sw.kovidgoyal.net/kitty/"><img alt="Kitty Terminal" src="https://img.shields.io/badge/Terminal-Kitty-111111?style=for-the-badge&logo=gnometerminal&logoColor=white"></a>
  <a href="https://www.nerdfonts.com/"><img alt="Nerd Fonts" src="https://img.shields.io/badge/Icons-Nerd_Fonts-0F172A?style=for-the-badge&logo=fontawesome&logoColor=white"></a>
</p>

## Ringkasan

Repo ini berisi konfigurasi kustom untuk Neovim + NvChad. Di dalamnya sudah ada konfigurasi UI, LSP, formatter, snippet, file explorer, Treesitter, dan beberapa plugin tambahan seperti Triforce, Trouble, Todo Comments, Markview, Neocord, Floaterm, Timerly, dan Typr.

Konfigurasi ini cocok untuk kamu yang ingin Neovim tampil seperti IDE, tetapi tetap ringan dan gampang dikustom.

## Fitur Utama

- Base editor menggunakan Neovim dan NvChad.
- Plugin dikelola otomatis oleh `lazy.nvim`.
- Tema `everblush` dengan statusline minimal.
- File explorer `nvim-tree` yang tetap menampilkan dotfiles dan file dari `.gitignore`.
- LSP untuk HTML, CSS, C/C++, PHP, Python, Go, TypeScript/JavaScript, Rust, dan Java.
- Inlay hints otomatis saat LSP aktif.
- Formatter via `conform.nvim` untuk Lua, CSS, HTML, Python, C/C++, PHP, JavaScript, TypeScript, dan Blade.
- Treesitter untuk syntax highlight beberapa bahasa populer.
- Dukungan Blade/PHP, snippet custom, TODO comments, diagnostics list, floating terminal, dan markdown preview.
- Siap dipakai bareng terminal modern seperti Kitty.

## Logo & Teknologi

| Teknologi | Fungsi | Link |
| --- | --- | --- |
| Neovim | Editor utama | [Website](https://neovim.io/) / [Download](https://github.com/neovim/neovim/releases/latest) |
| NvChad | Framework konfigurasi Neovim | [nvchad.com](https://nvchad.com/) |
| Lua | Bahasa konfigurasi | [lua.org](https://www.lua.org/) |
| lazy.nvim | Plugin manager | [folke/lazy.nvim](https://github.com/folke/lazy.nvim) |
| Kitty | Terminal yang direkomendasikan | [Download Kitty](https://sw.kovidgoyal.net/kitty/) |
| Nerd Fonts | Font agar icon tampil normal | [Download Nerd Fonts](https://www.nerdfonts.com/) |

## Struktur Project

```text
.
|-- init.lua                 # Bootstrap NvChad dan lazy.nvim
|-- lua/
|   |-- chadrc.lua           # Tema, UI, dashboard, highlight
|   |-- mappings.lua         # Keymap custom
|   |-- options.lua          # Opsi editor
|   |-- autocmds.lua         # Autocommand custom
|   |-- configs/             # Konfigurasi plugin/LSP/formatter
|   |-- plugins/             # Daftar plugin tambahan
|   `-- snippets/            # Snippet custom
|-- lazy-lock.json           # Versi plugin yang terkunci
`-- README.md
```

## Prasyarat

Sebelum install, pastikan beberapa tools ini sudah ada:

- [Neovim](https://github.com/neovim/neovim/releases/latest) versi modern.
- [Git](https://git-scm.com/).
- Terminal yang nyaman, misalnya [Kitty](https://sw.kovidgoyal.net/kitty/).
- [Nerd Font](https://www.nerdfonts.com/) supaya icon NvChad, file explorer, dan statusline tampil rapi.
- Tool bahasa sesuai kebutuhan, misalnya `node`, `npm`, `python`, `go`, `rust`, `clangd`, `php`, atau `composer`.

## Cara Install

### Linux, macOS, atau WSL

Backup config lama jika ada:

```bash
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || true
mv ~/.local/share/nvim ~/.local/share/nvim.bak 2>/dev/null || true
mv ~/.local/state/nvim ~/.local/state/nvim.bak 2>/dev/null || true
mv ~/.cache/nvim ~/.cache/nvim.bak 2>/dev/null || true
```

Clone repo ini:

```bash
git clone https://github.com/nabil-udah-kenyang/Nvchad-Configuration-.git ~/.config/nvim
```

Jalankan Neovim:

```bash
nvim
```

Saat pertama kali dibuka, `lazy.nvim` akan mengunduh plugin secara otomatis. Tunggu proses selesai, lalu restart Neovim.

### Windows PowerShell

Backup config lama jika ada:

```powershell
Rename-Item $env:LOCALAPPDATA\nvim nvim.bak -ErrorAction SilentlyContinue
Rename-Item $env:LOCALAPPDATA\nvim-data nvim-data.bak -ErrorAction SilentlyContinue
```

Clone repo ini:

```powershell
git clone https://github.com/nabil-udah-kenyang/Nvchad-Configuration-.git $env:LOCALAPPDATA\nvim
```

Jalankan:

```powershell
nvim
```

## One-liner

Untuk Linux, macOS, atau WSL:

```bash
git clone https://github.com/nabil-udah-kenyang/Nvchad-Configuration-.git ~/.config/nvim && nvim
```

## Setelah Install

Jalankan health check:

```vim
:checkhealth
```

Cek plugin:

```vim
:Lazy
```

Cek LSP aktif:

```vim
:LspInfo
```

Format file manual:

```vim
:lua require("conform").format()
```

## LSP yang Disiapkan

Konfigurasi LSP ada di `lua/configs/lspconfig.lua`.

| Bahasa | LSP |
| --- | --- |
| HTML | `html` |
| CSS | `cssls` |
| C/C++ | `clangd` |
| PHP | `intelephense` |
| Python | `pyright` |
| Go | `gopls` |
| JavaScript/TypeScript | `ts_ls`, `tsgo` |
| Rust | `rust_analyzer` |
| Java | `jdtls` |

Jika salah satu LSP belum aktif, install server yang sesuai lewat Mason atau package manager masing-masing bahasa.

## Formatter

Formatter diatur di `lua/configs/conform.lua`.

| Filetype | Formatter |
| --- | --- |
| Lua | `stylua` |
| CSS/HTML | `prettier` |
| Python | `black` |
| C/C++ | `clang-format` |
| PHP | `pint` |
| JavaScript/TypeScript | `prettierd` |
| Blade | `blade-formatter` |

## Customisasi

- Ubah tema dan tampilan di `lua/chadrc.lua`.
- Tambah atau ubah keymap di `lua/mappings.lua`.
- Atur behavior editor di `lua/options.lua`.
- Tambah plugin baru di folder `lua/plugins/`.
- Tambah snippet custom di folder `lua/snippets/`.

## Troubleshooting

Jika icon tidak muncul, pastikan terminal memakai Nerd Font.

Jika plugin gagal install, buka:

```vim
:Lazy
```

Lalu coba `sync` dari menu Lazy.

Jika LSP tidak jalan, cek:

```vim
:checkhealth lsp
:LspInfo
```

Jika formatter tidak jalan, pastikan binary formatter sudah terinstall dan bisa dipanggil dari terminal.

# Neovim Cheatsheet

> Gunakan `/kata` di Neovim untuk mencari shortcut dengan cepat.  
> Notasi: `Ctrl` = tombol Control, `Space` = tombol spasi, `Shift` = tombol Shift.

---

## Mode Normal — Navigasi

| Shortcut | Fungsi |
| --- | --- |
| `w` | Ke awal kata berikutnya |
| `b` | Ke awal kata sebelumnya |
| `e` | Ke akhir kata berikutnya |
| `0` | Ke awal baris |
| `^` | Ke karakter pertama yang bukan spasi di baris |
| `$` | Ke akhir baris |
| `gg` | Ke baris paling atas |
| `G` | Ke baris paling bawah |
| `{angka}gg` | Ke baris tertentu, contoh: `20gg` |
| `Ctrl-d` | Scroll setengah layar ke bawah |
| `Ctrl-u` | Scroll setengah layar ke atas |
| `zt` | Letakkan baris aktif di atas layar |
| `zz` | Letakkan baris aktif di tengah layar |
| `zb` | Letakkan baris aktif di bawah layar |

## Mode Normal — Masuk Mode Lain

| Shortcut | Fungsi |
| --- | --- |
| `i` | Insert sebelum kursor |
| `I` | Insert di awal teks pada baris |
| `a` | Insert setelah kursor |
| `A` | Insert di akhir baris |
| `o` | Buat baris baru di bawah lalu insert |
| `O` | Buat baris baru di atas lalu insert |
| `v` | Masuk Visual mode |
| `:` | Masuk Command-line mode |

## Mode Normal — Edit, Salin, & Hapus

| Shortcut | Fungsi |
| --- | --- |
| `x` | Hapus satu karakter di bawah kursor |
| `p` | Paste setelah kursor |
| `u` | Undo |
| `Ctrl-r` | Redo |
| `yy` | Salin satu baris |
| `{angka}yy` | Salin sejumlah baris, contoh: `3yy` |
| `dd` | Hapus satu baris |
| `{angka}dd` | Hapus sejumlah baris, contoh: `3dd` |
| `cc` | Hapus isi baris lalu masuk Insert mode |
| `{angka}cc` | Hapus sejumlah baris lalu masuk Insert mode |
| `S` | Hapus isi baris lalu masuk Insert mode |
| `ciw` | Ubah satu kata: hapus lalu masuk Insert mode |
| `diw` | Hapus satu kata |
| `yiw` | Salin satu kata |
| `.` | Ulangi perintah editing terakhir |

---

## Visual Mode — Dasar

| Shortcut | Fungsi |
| --- | --- |
| `Esc` | Kembali ke Normal mode |
| `y` | Salin pilihan |
| `d` | Hapus / cut pilihan |
| `v` | Mulai seleksi per karakter |
| `V` | Seleksi satu baris penuh |
| `v` → `b` → `e` | Pilih satu kata dari akhir ke awal |

## Visual Mode — Pilih Objek

> Awali dengan `v`, lalu ketik kombinasi berikut.

| Shortcut | Fungsi |
| --- | --- |
| `vit` | Pilih isi di dalam tag HTML / Blade |
| `vat` | Pilih tag beserta isinya |
| `vi(` atau `vib` | Pilih isi dalam `()` |
| `va(` atau `vab` | Pilih `()` beserta isinya |
| `va{` atau `vaB` | Pilih `{}` beserta isinya |

---

## Window & Buffer

| Shortcut | Fungsi |
| --- | --- |
| `Ctrl-w` + `←/↓/↑/→` | Pindah ke window sesuai arah |
| `Ctrl-w` lalu `v` | Split window vertikal |
| `Space` + `x` | Tutup buffer *(keymap custom)* |

## Keymap Custom / Plugin

| Shortcut | Fungsi |
| --- | --- |
| `Ctrl-j` | Multi-cursor mode |
| `Ctrl-p` | Buka floating terminal |
| `Ctrl-h` | Pindah ke panel terminal sebelah kiri |
| `Ctrl-l` | Pindah ke panel terminal sebelah kanan |

---

## Pola yang Perlu Diingat

```text
[angka] + perintah  → ulangi perintah beberapa kali
c                    → change: hapus lalu langsung Insert mode
d                    → delete: hapus tanpa masuk Insert mode
y                    → yank: salin
i                    → inside / di dalam objek
a                    → around / objek beserta pembungkusnya
```

Contoh cepat: `ciw` = ubah kata, `diw` = hapus kata, `yiw` = salin kata.


## Lisensi

Project ini mengikuti lisensi yang ada di file [LICENSE](./LICENSE). Silakan pakai, fork, dan modifikasi sesuai kebutuhan.
