FROM golang:1.24
WORKDIR /app 
COPY go.mod go.sum ./
RUN go mod download 
COPY *.go ./ 
COPY *.db ./ 
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /go-task-twelve
CMD ["/go-task-twelve"] 