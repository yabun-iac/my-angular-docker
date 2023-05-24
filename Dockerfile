# stage 1
FROM node:16 AS build
WORKDIR /usr/app
COPY ./ /usr/app
RUN npm ci && npm run build

# stage 2
FROM nginx:1.17.1-alpine
COPY --from=build /usr/app/dist/my-angular-docker /usr/share/nginx/html


