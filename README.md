# Nvchad Config — Nabil

Repo ini berisi konfigurasi kustom untuk Nvchad / Neovim, sudah di-suit untuk membuat Neovim bekerja seperti IDE lengkap.Ditambah dengan Plugin triforce 

## ✨ Fitur

- Setup Neovim + Nvchad dengan plugin yang sudah dikonfigurasi.  
- Konfigurasi kustom: keymaps, options, plugin tambahan sesuai kebutuhan.  
- Siap dipakai untuk development dengan berbagai bahasa (tergantung LSP / plugin).  

## ✅ Prasyarat

Sebelum install, pastikan:  
- Neovim (versi minimal cocok dengan LazyVim) terpasang. :contentReference[oaicite:2]{index=2}  
- Git terpasang.  
- (Opsional tapi direkomendasikan) Font patched seperti Nerd Font agar ikon dan simbol tampil dengan benar. :contentReference[oaicite:4]{index=4}  

## 🚀 Cara Install & Pakai

### Linux / macOS / WSL  
```bash
# (Opsional) backup konfigurasi Neovim kamu jika ada
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || true  
mv ~/.local/share/nvim ~/.local/share/nvim.bak 2>/dev/null || true  

# Clone repo konfigurasi ini
git clone https://github.com/nabil-udah-kenyang/Nvchad-Configuration-.git ~/.config/nvim

# Masuk ke direktori config (opsional)
cd ~/.config/nvim

# Jalankan Neovim — LazyVim akan install plugin otomatis
nvim
```

### Windows (PowerShell / CMD)  
```powershell
# (Opsional) backup jika kamu punya konfigurasi Neovim sebelumnya
# misalnya di %USERPROFILE%\AppData\Local\nvim

# Clone
git clone https://github.com/nabil-udah-kenyang/Nvchad-Configuration-.git $env:LOCALAPPDATA\nvim

# Masuk
cd $env:LOCALAPPDATA\nvim

# Jalankan Neovim
nvim
```

> Jika kamu menggunakan WSL di Windows, kamu bisa mengikuti instruksi Linux di atas (pada lingkungan WSL).

## 🎯 Cara Pakai Cepat (One-liner)  
Kamu bisa langsung clone + setup dengan satu perintah bash seperti ini (Linux / WSL / macOS):  
```bash
git clone https://github.com/nabil-udah-kenyang/Nvchad-Configuration-.git ~/.config/nvim && nvim
```

## 💡 Tes Setup & Troubleshoot  
Setelah pertama kali menjalankan `nvim`, disarankan untuk menjalankan perintah:  
```
:checkhealth
```  
Jika ada dependensi atau plugin belum terpenuhi, cek pesan error / rekomendasi. :contentReference[oaicite:5]{index=5}

## 🔧 Customisasi & Menambah Plugin / Konfigurasi  
- Tambahkan plugin baru dengan membuat file `.lua` di folder `lua/plugins/` sesuai struktur Nvchad. :contentReference[oaicite:6]{index=6}  
- Untuk mengubah opsi, keymap, dsb, modifikasi file konfigurasi sesuai layout di repo.  

## 📄 Lisensi & Catatan  
Konfigurasi ini sifatnya pribadi / kustom — kamu bebas pakai atau modifikasi sesuai kebutuhan.  

