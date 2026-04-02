# OpenClaw + Ollama Ultimate AI Stack

Bu proje, NVIDIA GPU destekli **OpenClaw** ve **Ollama**'yı tek bir Docker yapısında birleştirir.

## 🚀 Kullanım

1. **Repoyu Klonlayın ve Ayarları Yapın**:
   ```bash
   git clone https://github.com/Hasokeyk/openclaw-ollama.git
   cd openclaw-ollama
   cp .env.example .env
   ```

2. **Sistemi Başlatın**:
   ```bash
   docker-compose up -d
   ```
   *(Eğer Docker Hub'da hazır imaj varsa onu çeker, yoksa yerel Dockerfile üzerinden derleme yapar).*

## 🐳 Geliştiriciler İçin (Yayınlama)
İmajı Docker Hub'a kendi adınızla yüklemek isterseniz:
```bash
docker-compose build
docker push hasokeyk/openclaw-ollama:latest
```

## 🌐 Erişim
- **OpenClaw**: `http://localhost:18789`
- **Ollama**: `http://localhost:11435`
