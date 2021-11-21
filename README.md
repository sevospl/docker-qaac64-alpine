```
$ ./qaac_builder.sh
$ docker build -t qaac64 .
```

```
$ docker run --rm -v $PWD:/mnt qaac64 input.wav -V 127 --no-delay --no-optimize --verbose -o output.m4a
```
