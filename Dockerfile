FROM golang:latest
RUN mkdir /app
ADD . /app
WORKDIR /app
EXPOSE 8080
RUN go get -u github.com/gin-gonic/gin && go build -o avalaraapp 
CMD ["/app/avalaraapp"]
