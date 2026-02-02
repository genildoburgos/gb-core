## Stage 1: build
FROM node:18-alpine AS builder

WORKDIR /app

# Install build deps
COPY package*.json ./
RUN npm ci

# Copy sources and build
COPY . .
RUN npm run build

## Stage 2: run
FROM node:18-alpine
WORKDIR /app

ENV NODE_ENV=production

# Copy only what we need from builder
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist

EXPOSE 3000

CMD ["node", "dist/main"]
