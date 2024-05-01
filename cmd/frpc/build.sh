#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo $DIR
cd $DIR
rm -rf Frpclib.xcframework
go get -u golang.org/x/mobile/bind
go get -u golang.org/x/mobile/bind/objc
gomobile bind -target=ios
cd $THEOS/lib/iphone/rootless/
rm -rf Frpclib.framework
cd $DIR
cd ./Frpclib.xcframework/ios-arm64
cp -r Frpclib.framework $THEOS/lib/iphone/rootless/
cp -r Frpclib.framework $THEOS/lib/iphone/rootless/Frpclib.framework-0.57.0
cd $DIR
rm -rf Frpclib.xcframework
