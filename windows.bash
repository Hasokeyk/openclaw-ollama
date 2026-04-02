#!/bin/bash
echo "Windows üzerinde Docker konteynerleri baslatiliyor..."
echo "Not: Bu betigi Git Bash, WSL veya benzeri bir terminalde calistirin."

# Docker Compose'u baslat
docker-compose up --build -d

echo "----------------------------------------------------"
echo "Islem basariyla tamamlandi!"
echo "OpenClaw Arayuzu: http://localhost:18789"
echo "Ollama API: http://localhost:11434"
echo "----------------------------------------------------"
read -p "Kapatmak icin bir tusa basin..."
