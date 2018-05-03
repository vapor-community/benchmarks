# Benchmarks

A collection of plaintext benchmarks for popular web frameworks.

## Usage

These benchmarks are powered by Docker, first make sure Docker is installed and running.

Next, you will need to build images for each of the tests. You can do this using the `Makefile`.

```sh
make all
```

Once all of the images are built, you can run the benchmark script.

```sh
./benchmark.sh
```
