# Stage 1: Build React app
FROM node:18-alpine AS build

# Set working directory
WORKDIR /app

# Copy only package files to leverage caching
COPY package*.json ./

# Install dependencies (use ci for reproducibility)
RUN npm ci --legacy-peer-deps

# Copy the rest of the source code
COPY . .

# Build the React app for production
RUN npm run build

# Create a non-root user for security
RUN addgroup -S appgroup && adduser -S -G appgroup appuser

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Copy React build from previous stage
COPY --from=build /app/build /usr/share/nginx/html

# Expose port
EXPOSE 80

# Run nginx as non-root (optional for extra security)
USER appuser

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
