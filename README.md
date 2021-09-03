# LLVM-VE-RV Docker Image

## Build

```
docker build --network host --tag efocht/llvm-ve-rv:1.9b3 .

# tag as 'latest', if you like
docker image tag efocht/llvm-ve-rv:1.9b3 efocht/llvm-ve-rv:latest
```

## Upload to dockerhub
```
docker push efocht/llvm-ve-rv:1.9b3
docker push efocht/llvm-ve-rv:latest
```


