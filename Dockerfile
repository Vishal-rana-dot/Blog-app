FROM node:18-alpine
WORKDIR /app

# Install client dependencies and build
COPY client/package*.json ./client/
RUN cd client && npm install
COPY client/ ./client/
RUN cd client && npm run build

# Install server dependencies
COPY server/package*.json ./server/
RUN cd server && npm install --production
COPY server/ ./server/

# Move client build to server
RUN mv ./client/dist ./server/client/dist

WORKDIR /app/server
EXPOSE 8080
CMD ["npm","start"]