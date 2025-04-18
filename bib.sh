#!/usr/bin/env bash

DIR=$(pwd)

academic import /home/dharma/work/bib/bib/mine.bib content/ru/publication --compact --overwrite

cd ${DIR}/content/en/publication
find . -xtype l -delete
ln -s ../../ru/publication/* .
./rm-russian

cd ${DIR}
