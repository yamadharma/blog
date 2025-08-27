#!/usr/bin/env bash

# pipx install academic


DIR=$(pwd)

academic import /home/dharma/work/bib/bib/mine.bib content/ru/publication --compact --overwrite --verbose

cd ${DIR}/content/en/publication
find . -xtype l -delete
ln -s ../../ru/publication/* .
grep -r russian * | cut -f1 -d":" | xargs -r dirname | xargs -r rm

cd ${DIR}
