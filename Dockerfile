
# ### STAGE 1: Build ###
FROM node:20-alpine as build
WORKDIR /home/app
COPY package.json package-lock.json .
RUN npm ci
COPY . .
RUN npm run build

### STAGE 2: Run ###
FROM node:20-alpine as serve
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
ARG PORT=4200
ENV PORT=${PORT}
COPY --from=build /home/app/dist /home/app
RUN npm i -g serve
WORKDIR /home/app
EXPOSE 4200
# CMD ["serve", "-s", "browser", "-l", "4200"]
CMD ["node", "server/server.mjs"]
