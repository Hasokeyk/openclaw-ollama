FROM node:22-slim

RUN apt-get update && apt-get install -y \
    curl \
    git \
    python3 \
    make \
    g++ \
    socat \
    && npm install -g pnpm \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN git clone https://github.com/openclaw/openclaw.git .

RUN pnpm install && pnpm run build && (pnpm run ui:install || true) && (pnpm run ui:build || true)

RUN printf "#!/bin/bash\n\
socat TCP-LISTEN:18789,fork,reuseaddr TCP:127.0.0.1:18790 &\n\
socat TCP-LISTEN:18791,fork,reuseaddr TCP:127.0.0.1:18792 &\n\
socat TCP-LISTEN:11434,fork,reuseaddr TCP:ollama:11434 &\n\
node scripts/run-node.mjs gateway --port 18790 --allow-unconfigured\n" > /app/start.sh && chmod +x /app/start.sh

EXPOSE 18789 18791

ENTRYPOINT []
CMD ["/bin/bash", "/app/start.sh"]
