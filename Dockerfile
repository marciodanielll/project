FROM node:18-alpine

WORKDIR /app

RUN npm install -g @nestjs/cli@10.4.5

COPY . .

RUN npm install

RUN apk add git

CMD ["npm", "run", "start:debug"]
