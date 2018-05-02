# compile 

echo "⚙  Compiling"

cd express
npm i express
npm i cluster
cd ..

cd vapor-3
swift build -c release
cd ..

echo "⚙  Ready"
echo ""
echo ""

benchmark_do() {
    NAME=$1
    EXEC=$2
    FOLDER=$3

    echo "📊  $NAME"
    echo "Booting..."
    cd $FOLDER

    eval $EXEC &
    sleep 10s

    echo "📝  Testing GET /ping"
    curl --verbose http://127.0.0.1:8000/ping
    echo ""
    echo "🚀  Benchmarking"
    wrk -t 4 -c 128 -d 5 http://127.0.0.1:8000/ping
    kill -9 $(lsof -ti tcp:8000)

    cd ../
    echo ""
    echo ""
}

benchmark_do "Express (Node.js)" "node app.js" express
benchmark_do "Gin (Go)" "go run ping.go" gin
benchmark_do "Ruby on Rails" "RAILS_ENV=production rails server -p 8000" ruby-on-rails
benchmark_do "Vapor 3 (Swift)" "swift run -c release Benchmark serve -e prod" vapor-3

echo ""
echo "✅  Done"
