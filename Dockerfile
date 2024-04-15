#Stage-1
FROM node:lts-alpine3.19 as build
WORKDIR /app
COPY . .
RUN npm install && npm run build
#Stage-2
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html