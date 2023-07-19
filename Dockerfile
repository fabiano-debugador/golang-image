FROM golang:1.20 AS build
WORKDIR /src

RUN go mod init example/hello

COPY . .

RUN go build hello.go

FROM scratch

WORKDIR /root/

COPY --from=build /src/hello .

EXPOSE 8000

CMD ["./hello"]