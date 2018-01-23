#! /bin/bash
REACT_APP_PATH=$1
HOST=$(hostname --ip-address)
docker run -it -p 19000-19001:19000-19001 -v $REACT_APP_PATH:/app -e REACT_NATIVE_PACKAGER_HOSTNAME='$HOST' jacobamason/crna

