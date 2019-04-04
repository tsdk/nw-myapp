#!/bin/sh

dir=$(cd `dirname $0`;pwd)

if [ -z $1 ];then
read -p "platform=(win|gnu)? " platform
else
platform=${platform:-`uname -s`}
fi

case $platform in
    win*) 
        cat package.json | perl -pe 's/\$([^\s"]+)/%\1%/g' > package-tmp.json
        mv package-tmp.json package.json
        echo 'done';;
    Linux*);&
    Darwin*);&
    gnu)
        cat package.json | perl -pe 's/%([^%]+?)%/\$\1/g' > package-tmp.json
        mv package-tmp.json package.json
        echo 'done';;
    help);&
    *) echo 'input error';;
esac
