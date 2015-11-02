#!/bin/bash -f

if [ -z "$1" ]
then
  print "No argument is given"
  return 1
fi

targetpath=$1

if [ "x$targetpath" != "xdebs" ] && [ "x$targetpath" != "xjiocloud" ] && [ "x$targetpath" != "xjiocloudcompute" ]
then
  echo "Invalid target path"
  return 2
fi

filename=""
if [  -z "$2" ]
then
  filename=""
else
  filename=$2
fi

if [ "x$filename" == "x" ]
then
  echo "Invalid package name is given"
  return 3
fi
echo "Path is $targetpath/amd64/$filename"

if ! [ -f "$targetpath/amd64/$filename" ]; then
  echo "Given package $filename under $targetpath does not exist"
  return 4
fi

pushd .

cd $targetpath

git rm -f -- amd64/$filename

dpkg-scanpackages amd64 | gzip -9c > amd64/Packages.gz

git add amd64/Packages.gz

popd

return 0

