FROM golang:alpine AS builder
WORKDIR $GOPATH/src/desafio-go/
COPY . .
RUN go mod init && \ 
    go mod download && \ 
    go install 

FROM scratch
COPY --from=builder /go/bin/desafio-go /go/bin/desafio-go
ENTRYPOINT ["/go/bin/desafio-go"]