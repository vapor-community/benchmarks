IP=`docker-machine ip`

benchmark_do() {
    NAME=$1
    ID=$2

    echo "📊  $NAME"
    CID=`docker run -d -p 9000:9000 benchmark-$ID`
    echo "Booting..."
    sleep 2

    echo "📝  Testing GET /ping"
    TEST=`curl --verbose http://$IP:9000/ping 2>&1`
    if [[ $TEST != *"pong"* ]]; then
        echo "⚠️  pong not detected"
    fi
    if [[ $TEST != *"text/plain; charset=utf-8"* ]]; then
        echo "⚠️  incorrect content-type"
    fi
    if [[ $TEST != *"HTTP/1.1 200 OK"* ]]; then
        echo "⚠️  incorrect status"
    fi
    if [[ $TEST != *"ength: 4"* ]]; then
        echo "⚠️  incorrect length"
    fi
    if [[ $TEST != *"ate: "* ]]; then
        echo "⚠️  no date header"
    fi

    echo "🚀  Benchmarking"
    wrk -t 4 -c 128 -d 5 http://$IP:9000/ping

    docker stop $CID

    echo ""
}

benchmark_do "Express (Node.js)" express
benchmark_do "Gin (Go)" gin
benchmark_do "Flask (Python)" flask
benchmark_do "HTTP (Swift)" http
benchmark_do "Rails (Ruby)" rails
benchmark_do "Vapor 2 (Swift)" vapor-2
benchmark_do "Vapor 3 (Swift)" vapor-3

echo "✅  Done"
