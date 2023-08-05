FROM node:16.13-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install -g @angular/cli

COPY . .

RUN npm run build --prod