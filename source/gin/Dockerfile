FROM golang

WORKDIR /code
COPY . .

RUN go get -u github.com/gin-gonic/gin
RUN go build main.go

CMD ./main
