# Dockerfile
FROM quay.io/projectquay/golang:1.23 AS builder
WORKDIR /go/src/app
COPY . .
RUN go get
RUN make build

FROM scratch
WORKDIR /
COPY --from=builder /go/src/app/kbot .
ENTRYPOINT ["./kbot"]