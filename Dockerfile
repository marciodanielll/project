FROM node:18-alpine

WORKDIR /app

RUN npm install -g @nestjs/cli@10.4.5

COPY . .

RUN npm install

CMD ["npm", "run", "start:debug"]
