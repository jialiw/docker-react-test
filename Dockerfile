FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . . 
RUN npm run build 
# result will be stored in /build folder

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# nginx runs automatically --> no need to have 'CMD'