```
$ docker build -t qaac64 .
```

```
$ docker run --rm -v $PWD:/mnt qaac64 input.wav -V 110 --no-delay --ignorelength -o output.m4a
```
