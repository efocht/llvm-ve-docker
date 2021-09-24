#!/bin/bash

VENODEID=${VE_NODE_NUMBER:-0}
if [ -e "/dev/veslot$VENODEID" ]; then
    VE=$(readlink -f /dev/veslot$VENODEID)
    VEDEVICE_="--device $VE:$VE"
    VEVEOS_="-v /var/opt/nec/ve/veos:/var/opt/nec/ve/veos:z"
fi
docker run -it --rm \
    -v /dev:/dev:z \
    $VEDEVICE_ $VEVEOS_ \
    -v /opt/nec/ve/ncc:/opt/nec/ve/ncc:z \
    -v /opt/nec/ve/nfort:/opt/nec/ve/nfort:z \
    -v /opt/nec/ve/nlc:/opt/nec/ve/nlc:z \
    -v /opt/nec/aur_license:/opt/nec/aur_license:z \
    -v /var/opt/nec/aur_license:/var/opt/nec/aur_license:z \
    -v /opt/nec/ve/bin/ncc:/opt/nec/ve/bin/ncc:z \
    -v /opt/nec/ve/lib:/opt/nec/ve/lib:z \
    -v $HOME:$HOME:z \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    -u $(id -u):$(id -g) \
    -w $PWD \
    --network host \
    efocht/llvm-ve-rv:latest
