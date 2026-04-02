#!/bin/bash

echo "------------------------------------------------"
echo "🔍 SISTEM TESTI BASLATILIYOR..."
echo "------------------------------------------------"

# 1. Ollama Direkt API Testi
echo -n "1. Ollama API Testi (ollama-cuda:11434): "
OLLAMA_RES=$(docker exec ollama-cuda curl -s -X POST http://localhost:11434/api/generate -d '{"model": "qwen2.5:7b", "prompt": "hi", "stream": false}')
if [[ $OLLAMA_RES == *"response"* ]]; then
    echo "BAŞARILI ✅"
else
    echo "BAŞARISIZ ❌"
    echo "Hata: $OLLAMA_RES"
fi

# 2. OpenClaw Socat Köprü Testi
echo -n "2. OpenClaw Ollama Köprü Testi (127.0.0.1:11434): "
BRIDGE_RES=$(docker exec openclaw-app curl -s -X POST http://127.0.0.1:11434/api/generate -d '{"model": "qwen2.5:7b", "prompt": "hi", "stream": false}')
if [[ $BRIDGE_RES == *"response"* ]]; then
    echo "BAŞARILI ✅"
else
    echo "BAŞARISIZ ❌"
    echo "Hata: $BRIDGE_RES"
fi

# 3. OpenClaw Agent Testi
echo "3. OpenClaw Agent Mesaj Testi: "
AGENT_RES=$(docker exec openclaw-app node openclaw.mjs agent -m "Merhaba, sadece 'Test tamam' de." --agent main --session-id "final-test-123")
echo "   Asistan Cevabı: $AGENT_RES"

if [[ $AGENT_RES == *"Test tamam"* ]]; then
    echo "------------------------------------------------"
    echo "✅ TÜM SİSTEMLER ÇALIŞIYOR!"
    echo "------------------------------------------------"
else
    echo "------------------------------------------------"
    echo "❌ OPENCLAW CEVAP VEREMEDI!"
    echo "------------------------------------------------"
fi
