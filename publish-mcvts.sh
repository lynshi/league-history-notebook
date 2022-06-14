#/bin/bash

set -e

jupyter nbconvert \
    --to html \
    --template lab \
    --theme dark \
    --execute \
    mcvts.ipynb

azcopy copy \
    "mcvts.html" \
    "https://mcvtsfbois.blob.core.windows.net/\$web/mcvts.html"
