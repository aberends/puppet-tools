#!/bin/bash
RPM=puppet-tools
tar -cz --exclude=.git -f ~/rpm/SOURCES/${RPM}.tar.gz ${RPM}
rpmbuild --target noarch --clean -bb ${RPM}.spec
RC=$?
if [ $RC -ne 0 ]; then
  echo "ERROR: rpmbuild failed with exit code: $RC"
fi
rm ~/rpm/SOURCES/${RPM}.tar.gz
exit $RC
