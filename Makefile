all: go node python ruby swift

# Go
go: gin
gin:
	docker build -t benchmark-gin source/gin

# Node.js
node: express
express:
	docker build -t benchmark-express source/express

# Python
python: flask
flask:
	docker build -t benchmark-flask source/flask

# Ruby
ruby: rails
rails:
	docker build -t benchmark-rails source/rails


# Swift
swift: vapor-3
vapor-3:
	docker build -t benchmark-vapor-3 source/vapor-3

clean:
	docker stop $(docker ps -a -q)
	docker rm $(docker ps -a -q)
	docker images -a | grep "benchmark-" | awk '{print $3}' | xargs docker rmi
	rm -rf bin/*
