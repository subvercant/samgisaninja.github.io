#!/bin/bash
rm Packages
dpkg-scanpackages -m ./debs > Packages
rm -f Packages.bz2
cp Packages Packages2
bzip2 Packages
mv Packages2 Packages

#!/bin/bash
for file in ./debs/*
do
  /usr/local/bin/dpkg-deb -I "$file"
  echo Filename: $file
  echo "AUTOREPO_NEXTPACKAGE"
  sleep 0.1
done
