# Use a imagem Node.js Alpine como base
FROM node:18-alpine

# Define o diretório de trabalho
WORKDIR /app

# Instala o Nest CLI globalmente
RUN npm install -g @nestjs/cli@10.4.5

# Copia os arquivos restantes do projeto (caso tenha arquivos customizados)
COPY . .

# Instala as dependências (após o projeto ser criado e arquivos copiados)
RUN npm install

# Define o comando padrão para iniciar o servidor em modo debug
CMD ["npm", "run", "start:debug"]
