# base image
FROM node:10-alpine AS builder

COPY package.json package-lock.json ./

RUN npm ci && mkdir /ng-app && mv ./node_modules ./ng-app

WORKDIR /ng-app

COPY . .

RUN npm install -g @angular/cli

RUN npm run ng build

FROM nginx:alpine

COPY --from=builder /ng-app/dist/* /usr/share/nginx/html/

RUN rm /etc/nginx/conf.d/default.conf

COPY default.conf /etc/nginx/conf.d

ENTRYPOINT ["nginx", "-g", "daemon off;"]
