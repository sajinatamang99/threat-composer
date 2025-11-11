# Stage 1: Build React app
FROM node:20-alpine AS build

# Set working directory
WORKDIR /app

# Copy only package files to leverage caching
COPY package*.json ./

# Install dependencies
RUN npm install --legacy-peer-deps
RUN npm install ajv@8.12.0 ajv-keywords@5.1.0 --legacy-peer-deps
RUN npm install zod@3.21.4 --legacy-peer-deps

# Copy the rest of the source code
COPY . .

# Build the React app for production
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Create a non-root user for security
RUN addgroup -S appgroup && adduser -S -G appgroup appuser

# Copy React build from previous stage
COPY --from=build /app/build /usr/share/nginx/html

# Change ownership of HTML folder
RUN chown -R appuser:appgroup /usr/share/nginx/html

# Expose port
EXPOSE 80

# Run nginx as non-root user
USER appuser

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
