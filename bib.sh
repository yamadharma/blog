#!/bin/sh

sed -i -e "s:/home/dharma/work/science/Публикациии/bib/files/:/files/bib/:g" my.bib

~/.local/bin/academic import --bibtex my.bib --publication-dir ru/publication # --overwrite