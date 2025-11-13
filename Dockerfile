# --- Etap 1: build (np. React / Vite / static site generator) ---
FROM node:20-alpine AS builder
WORKDIR /app

# Tutaj w normalnym projekcie:
# COPY package*.json ./
# RUN npm install
# COPY . .
# RUN npm run build

# A w tym prostym przypadku po prostu tworzymy plik:
RUN echo '<h1>Hello Docker</h1>' > index.html

# --- Etap 2: final (serwer www) ---
FROM nginx:alpine
COPY --from=builder /app/index.html /usr/share/nginx/html/index.html
