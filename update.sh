#!/bin/bash -f

if [ -z "$1" ]
then
  echo "No argument is given"
  return 1
fi

filepath=$1
if [ ! -f $filepath ]
then
  echo "Given package $filepath does not exists"
  return 2
fi

targetpath="debs"
if [  -z "$2" ]
then
  targetpath="debs"
else
  targetpath=$2
fi

if [ "x$targetpath" != "xdebs" ] && [ "x$targetpath" != "xjiocloud" ] && [ "x$targetpath" != "xjiocloudcompute" ]
then
  echo "Invalid target path"
  return 3
fi

pushd .

cp $filepath $targetpath/amd64
cd $targetpath

dpkg-scanpackages amd64 | gzip -9c > amd64/Packages.gz

git add amd64/Packages.gz
git add amd64/`basename $filepath`

popd

return 0

