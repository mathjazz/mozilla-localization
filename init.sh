#!/bin/bash
INPUT=repos.csv
OLDIFS=$IFS
IFS=,
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
while read reponame repourl
do
    if [[ -n "$reponame" && -n "$repourl" && $reponame != "reponame" && $repourl != "repourl" ]]; then
        echo "Creating $reponame ..."
        mkdir "$reponame"
        cd "$reponame"
        svn checkout "$repourl"
        cd ..
    fi
done < $INPUT
IFS=$OLDIFS

echo "*~" > .gitignore
echo ".svn" >> .gitignore
echo ".git" >> .gitignore
echo "*#" >> .gitignore

