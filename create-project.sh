#!/bin/sh

usage() {
  echo "Usage: $0 <project-name> <base-directory>"
}

copy_skeleton() {
  echo "HEIJEWEHWJEH"
  RSYNCINCLUDES=`mktemp`
  RSYNCEXCLUDES=`mktemp`
  git ls-files > $RSYNCINCLUDES
  echo '*' > $RSYNCEXCLUDES
  cat $RSYNCINCLUDES
  rsync --include-from=$RSYNCINCLUDES $1
  rsync -ar --files-from=$RSYNCINCLUDES --include-from=$RSYNCINCLUDES --exclude-from=$RSYNCEXCLUDES . $1
  rm -f $RSYNCINCLUDES $RSYNCEXCLUDES
}

cleanup() {
  echo "Removing .git directory and copy of this ($0) script..."
  cd $FINALDESTINATION && rm -rf .git && rm -rf `basename $0` && cd -
}

updatename() {
  echo "Updating files - renaming all occurences of $SKELNAME with $PROJECTNAME..."
  cd $FINALDESTINATION
  tempfile=`mktemp`
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
copy_skeleton $FINALDESTINATION/ && updatename && echo done && exit 0
echo "Something went bad."
exit 1
