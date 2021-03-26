#!/bin/bash

usage() {
  echo "Usage:"
  echo "  adbx proxy set"
  echo "  adbx proxy get"
  echo "  adbx proxy remove"
}


if [ $# -lt 1 ]
then
  usage
  exit 1
fi

# adb shell settings get global http_proxy

case $1 in
  proxy) 
    case $2 in
      get) adb shell settings get global http_proxy;;
      set) 
        ip=$(ipconfig getifaddr en0)
        port=":8888"
        adb shell settings put global http_proxy $ip$port;;
      remove) 
        adb shell settings put global http_proxy :0
      *) usage;;
    esac
  ;;
  *) usage;;
esac