FROM node:16
WORKDIR /usr/src/app
COPY package*.json app.js templates/* ./
RUN npm install
EXPOSE 3000
CMD ["node", "app.js"]