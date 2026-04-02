#!/bin/bash
# Linux Bash Script

echo "Linux uzerinde Docker konteynerleri baslatiliyor..."

# Docker compose komutunun varligini kontrol et
if ! command -v docker-compose &> /dev/null
then
    echo "Hata: docker-compose bulunamadi! Lutfen yukleyin."
    exit
fi

# Docker servisini baslat (Gerekirse sudo ile)
if [[ $EUID -ne 0 ]]; then
   echo "Not: Eger yetki hatasi alirsaniz lutfen 'sudo ./linux.sh' olarak calistirin."
fi

docker-compose up --build -d

echo "----------------------------------------------------"
echo "Islem basariyla tamamlandi!"
echo "OpenClaw Arayuzu: http://localhost:18789"
echo "Ollama API: http://localhost:11434"
echo "----------------------------------------------------"
