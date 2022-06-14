#/bin/bash

if [ $# -ne 1 ]; then
    echo "Expected one argument (the Microsoft Storage Account tenant id) e.g. './publish-mcvts.sh 012345'"
    exit 1
fi

jupyter nbconvert \
    --to html \
    --template lab \
    --theme dark \
    --execute \
    mcvts.ipynb

azcopy login --tenant-id "$1"
azcopy copy \
    "mcvts.html" \
    "https://mcvtsfbois.blob.core.windows.net/\$web/mcvts.html"
