#!/bin/sh

usage() {
  echo "Usage: $0 <project-name> <base-directory>"
}

updatename() {
  tempfile=`tempfile`
  for f in `find . -type f`; do
    cat $f | sed s/$SKELNAME/$PROJECTNAME/g > $tempfile
    mv $tempfile $f
  done
}

SKELNAME=cpp_skel_project
if [ "x$2" = "x" ]; then
  usage
  exit 1
fi

PROJECTNAME=$1
DESTDIR=$2

if [ ! -d "$DESTDIR" ]; then
  echo "Directory "$DESTDIR" does not exist! Create it first. Exiting..."
  exit 1
fi

FINALDESTINATION="$DESTDIR/$PROJECTNAME"
mkdir -p "$FINALDESTINATION"

cp -af * $FINALDESTINATION && cd $FINALDESTINATION && rm -rf .git && updatename
