#!/bin/bash

echo "======================================================"
echo "          Selamat Datang di Manajemen File      "
echo "======================================================"
echo "=================== Dibuat Oleh ======================"
echo "                  Farhan Mawaludin             "
echo "                    2341720258                        "
echo "=================== Kelas TI-1B ======================"


# Menampilkan isi direktori saat ini
lihat_isi_direktori() {
    ls -l
}

# Membuat direktori baru
buat_direktori() {
    read -p "Masukkan nama direktori baru: " direktori
    mkdir -p "$direktori"
    echo "Direktori $direktori berhasil dibuat."
}

# Pindah ke direktori yang diinginkan
pindah_direktori() {
    read -p "Masukkan direktori tujuan: " direktori
    cd "$direktori" || { echo "Gagal pindah ke direktori $direktori"; return; }
    echo "Direktori saat ini: $(pwd)"
}

# Menampilkan path saat ini
lihat_path_saat_ini() {
    pwd
}

# Melihat isi file
lihat_isi_file() {
    read -p "Masukkan nama file: " file
    if [ -f "$file" ]; then
        cat "$file"
    else
        echo "File $file tidak ditemukan."
    fi
}

# Menyalin berkas
salin_berkas() {
    read -p "Masukkan nama file sumber: " sumber
    read -p "Masukkan nama file tujuan: " tujuan
    cp "$sumber" "$tujuan"
    echo "Berkas $sumber berhasil disalin ke $tujuan."
}

# Mengubah nama berkas
ubah_nama_berkas() {
    read -p "Masukkan nama file lama: " lama
    read -p "Masukkan nama file baru: " baru
    mv "$lama" "$baru"
    echo "Berkas $lama berhasil diubah namanya menjadi $baru."
}

# Menghapus berkas
hapus_berkas() {
    read -p "Masukkan nama file yang akan dihapus: " file
    rm "$file"
    echo "Berkas $file berhasil dihapus."
}

# Memindahkan file
pindahkan_file() {
    read -p "Masukkan nama file sumber: " sumber
    read -p "Masukkan nama file tujuan: " tujuan
    mv "$sumber" "$tujuan"
    echo "Berkas $sumber berhasil dipindahkan ke $tujuan."
}

# Melihat pengguna yang sedang login
lihat_pengguna() {
    who
}

# Menampilkan menu
tampilkan_menu() {
    echo "===== Menu ====="
    echo "1. Lihat Isi Direktori"
    echo "2. Buat Direktori"
    echo "3. Pindah Direktori"
    echo "4. Lihat Path Saat Ini"
    echo "5. Lihat Isi File"
    echo "6. Salin Berkas"
    echo "7. Ubah Nama Berkas"
    echo "8. Hapus Berkas"
    echo "9. Pindahkan File"
    echo "10. Lihat Pengguna"
    echo "11. Keluar"
}

# Menjalankan perintah sesuai dengan pilihan menu
jalankan_menu() {
    case $1 in
        1) lihat_isi_direktori ;;
        2) buat_direktori ;;
        3) pindah_direktori ;;
        4) lihat_path_saat_ini ;;
        5) lihat_isi_file ;;
        6) salin_berkas ;;
        7) ubah_nama_berkas ;;
        8) hapus_berkas ;;
        9) pindahkan_file ;;
        10) lihat_pengguna ;;
        11) echo "Keluar dari program." ;;
        *) echo "Pilihan tidak valid." ;;
    esac
}

# Looping untuk menampilkan menu hingga pengguna memilih untuk keluar
while true; do
    tampilkan_menu
    read -p "Pilih menu: " pilihan
    jalankan_menu $pilihan

    # Jika pilihan adalah 11 (Keluar), maka keluar dari loop
    if [ "$pilihan" -eq 11 ]; then
        break
    fi

    echo 
done

