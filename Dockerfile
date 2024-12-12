FROM node:18-alpine as builder

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run build

FROM node:18-alpine as runner

WORKDIR /app

COPY --from=builder /app/package*.json ./
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/tsconfig*.json ./
COPY --from=builder /app/.env ./

CMD ["sh", "-c", "npm ci --only=production && node dist/main"]
