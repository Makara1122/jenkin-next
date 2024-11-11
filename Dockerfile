# stage 1: Build application 

FROM node:20-alpine AS build 
WORKDIR /app
COPY . .
RUN npm install 
RUN npm run build

# stage 2: Run the application

FROM node:20-alpine 
WORKDIR /app
COPY --from=build /app .
EXPOSE 3000
CMD ["npm","run", "start"]