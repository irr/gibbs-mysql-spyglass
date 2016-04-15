#!/usr/bin/env bash
BASE_URL="https://github.com/AgilData/gibbs-mysql-spyglass/releases/download"
VERSION="v0.1.5"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
        PLATFORM="x86_64-unknown-linux-gnu"
        DISTRO=$(cat /etc/*-release | grep '^NAME=' | awk -F= '{print $2}' | sed 's/\"//g')
        if [[ "$DISTRO" == "Amazon Linux AMI" ]]; then
                yum install -y openssl-devel
        elif [[ "$DISTRO" == "Ubuntu" ]]; then
                apt-get install -y libssl-dev
        fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
        PLATFORM="x86_64-apple-darwin"
fi

FILENAME="gibbs-mysql-spyglass-${VERSION}-${PLATFORM}.tar.gz"
wget $BASE_URL/$VERSION/$FILENAME
tar -xvf $FILENAME