#!/usr/bin/env bash

set -ex
PACKAGE="$1"

if [[ $PACKAGE != "https://"* ]]; then
    echo "Usage: ${0} <url>, where url is URL of tar.gz source package"
    exit 1
fi

GENERATOR="https://raw.githubusercontent.com/flatpak/flatpak-builder-tools/master/npm/flatpak-npm-generator.py"
TMP=$( mktemp -d )
OUTPUT="generated-sources.json"
LOCK="package-lock.json"

curl -vL $PACKAGE | bsdtar -xvf- -C ${TMP}
pushd ${TMP}/*/

npm i --package-lock-only
curl $GENERATOR -o generator.py
python3 generator.py ${LOCK} -o ${OUTPUT}
OUTPUTPATH=${PWD}

popd
mv ${OUTPUTPATH}/{${OUTPUT},${LOCK}} ./
rm -r ${TMP}
