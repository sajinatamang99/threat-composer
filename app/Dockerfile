FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./

RUN npm install --legacy-peer-deps
RUN npm install ajv@6.12.6 ajv-keywords@3.5.2 --legacy-peer-deps
RUN npm install zod@3.21.4 --legacy-peer-deps

COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
