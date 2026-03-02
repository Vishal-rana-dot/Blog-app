FROM node:18-alpine

WORKDIR /app

# install backend dependencies
COPY server/package*.json ./
RUN npm install

# copy backend
COPY server/ ./

# copy frontend build
COPY client/dist ./client/dist

EXPOSE 8080

CMD ["npm","start"]