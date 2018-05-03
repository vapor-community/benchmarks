FROM swift

WORKDIR /code

COPY . .

RUN swift build -c release

CMD .build/release/main -e prod
