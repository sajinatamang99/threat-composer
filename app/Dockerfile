# Stage 1: Build React app
FROM node:18-alpine AS build

WORKDIR /app
COPY package*.json ./

RUN npm install --legacy-peer-deps
RUN npm install ajv@8.12.0 ajv-keywords@5.1.0 --legacy-peer-deps
RUN npm install zod@3.21.4 --legacy-peer-deps

COPY . .
RUN npm run build

# Stage 2: Serve with Nginx as non-root
FROM nginx:alpine

# Create non-root user
RUN addgroup -S appgroup && adduser -S -G appgroup appuser

# Copy build
COPY --from=build /app/build /usr/share/nginx/html

# Make html folder writable
RUN chown -R appuser:appgroup /usr/share/nginx/html

# Nginx logs folder for non-root
RUN mkdir -p /var/log/nginx && chown -R appuser:appgroup /var/log/nginx

# Copy default nginx config and adjust user
RUN sed -i 's/user  nginx;/user appuser;/' /etc/nginx/nginx.conf

# Switch to non-root
USER appuser

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
