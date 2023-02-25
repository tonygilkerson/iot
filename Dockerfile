############################################
## build
############################################
FROM golang as build

WORKDIR /build
COPY . .

RUN go install github.com/adhocteam/pushup@latest
RUN pushup build


############################################
## prod
############################################
FROM golang

WORKDIR /app

COPY --from=build /build/build/bin/myproject .
CMD ./myproject

EXPOSE 8080