# OpenClaw + Ollama Ultimate AI Stack

Bu repo, **OpenClaw** asistanını ve **Ollama**'yı tek bir Docker yapısında birleştiren, NVIDIA GPU (CUDA) destekli, Telegram ve İnternet erişimi hazır profesyonel bir yapay zeka istifidir.

## 🚀 Özellikler
- **NVIDIA GPU Desteği**: Yerel modellerinizi ekran kartınızın tam performansıyla çalıştırın.
- **Telegram Entegrasyonu**: Asistanınıza her yerden erişin.
- **İnternet Erişimi**: Tavily API ile asistanınız güncel haberleri araştırabilir.
- **Gemini Desteği**: Google Gemini API'yi ikincil beyin olarak kullanın.
- **Socat Bridge**: Docker ağ kısıtlamalarını aşan otomatik ağ köprüleri.

## 🛠️ Kurulum

1. **Repoyu Klonlayın**:
   ```bash
   git clone <repo-url>
   cd openclaw-ollama-stack
   ```

2. **Ayarları Yapın**:
   `.env.example` dosyasının adını `.env` yapın ve anahtarlarınızı girin:
   ```bash
   cp .env.example .env
   ```

3. **Sistemi Başlatın**:
   ```bash
   docker-compose up --build -d
   ```

## 🌐 Erişim
- **OpenClaw Arayüzü**: `http://localhost:18789`
- **Ollama API**: `http://localhost:11435`

## 🐳 Docker İmajı Olarak Yayınlama
İmajı Docker Hub'da yayınlamak için:
```bash
docker tag oo-openclaw:latest kullaniciadi/openclaw-ollama:v1.0
docker push kullaniciadi/openclaw-ollama:v1.0
```

---
*Created with Gemini CLI*
