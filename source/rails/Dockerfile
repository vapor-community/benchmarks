FROM ruby

WORKDIR /code

COPY . .

RUN bundle install

CMD ["bin/rails", "s", "-b", "0.0.0.0", "-p", "9000", "-e", "production"]
