FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#all files are in /app/build

FROM nginx:alpine as server
COPY --from=builder /app/build /usr/share/nginx/html
