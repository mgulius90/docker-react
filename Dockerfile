#fase 1
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build
#este comando no va cuando pasamos a produccion
#CMD ["npm", "run", "build"]

#/app/build <--- all the stuff we care about y se va a copiar en la proxima fase

#fase 2
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
