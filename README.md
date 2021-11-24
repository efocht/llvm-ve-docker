# LLVM-VE-RV Docker Image

## Build

```
LLVMVER=2.0.0
docker build --network host --tag efocht/llvm-ve-rv:$LLVMVER .

# tag as 'latest', if you like
docker image tag efocht/llvm-ve-rv:$LLVMVER efocht/llvm-ve-rv:latest
```

## Upload to dockerhub
```
docker push efocht/llvm-ve-rv:$LLVMVER
docker push efocht/llvm-ve-rv:latest
```


