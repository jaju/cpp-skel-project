#!/bin/sh

usage() {
  echo "Usage: $0 <project-name> <base-directory>"
}

cleanup() {
  echo "Removing .git directory and copy of this ($0) script..."
  cd $FINALDESTINATION && rm -rf .git && rm -rf `basename $0` && cd -
}

updatename() {
  echo "Updating files - renaming all occurences of $SKELNAME with $PROJECTNAME..."
  cd $FINALDESTINATION
  tempfile=`tempfile`
  for f in `find . -type f`; do
    cat $f | sed s/$SKELNAME/$PROJECTNAME/g > $tempfile
    mv $tempfile $f
  done
  cd -
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

echo "Creating copy of skeleton at $FINALDESTINATION..."
rsync -cavzu ./ $FINALDESTINATION/ &>/dev/null && cleanup && updatename
