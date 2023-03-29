from node:16-alpine as builder

# npm install
WORKDIR '/app'
COPY package.json .
RUN npm install

# copy src
COPY . .

RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
