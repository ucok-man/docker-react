# first phase
FROM node:16-alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# second phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
