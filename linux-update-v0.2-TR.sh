#!/bin/bash

# Renkler için tanımlamalar
GREEN="\e[32m"
YELLOW="\e[33m"
RESET="\e[0m"

# Başlık ve bilgi mesajlarını gösteren bir fonksiyon
function print_message {
    echo -e "${GREEN}$1${RESET}"
}

# Uyarı mesajlarını gösteren bir fonksiyon
function print_warning {
    echo -e "${YELLOW}$1${RESET}"
}

# Başlık
echo "
   ______      __                                         
  / ____/_  __/ /_  ___  _______  ______  ____  ___  _____
 / /   / / / / __ \/ _ \/ ___/ / / / __ \/ __ \/ _ \/ ___/
/ /___/ /_/ / /_/ /  __/ /  / /_/ / / / / / / /  __/ /    
\____/\__, /_.___/\___/_/   \__,_/_/ /_/_/ /_/\___/_/     
     /____/                                               
"
sleep 1

# Güncelleme işlemi başladı
print_message "Linux güncelleme işlemi başladı..."

# Paket veritabanını güncelle
print_message "Paket veritabanı güncelleniyor..."
sudo apt update

# Sistem güncellemelerini uygula
print_message "Sistem güncellemeleri uygulanıyor..."
sudo apt full-upgrade -y

# Artık paketleri temizle
print_message "Artık paketler temizleniyor..."
sudo apt autoremove -y

# Güvenlik güncellemelerini kontrol et
print_warning "Güvenlik güncellemeleri kontrol ediliyor..."
sudo unattended-upgrade --dry-run --debug

# Güncelleme işlemi tamamlandı
print_message "Linux güncelleme işlemi başarıyla tamamlandı :D"
