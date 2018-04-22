#! /bin/bash -e

set -e
set -o pipefail

SCRIPTS="app/build-and-test-all.sh
app/build-and-test-all-eventuate-local.sh
app/build-and-test-all-eventuate-local-postgres.sh
"

date > build-and-test-everything.log

for script in $SCRIPTS ; do
   echo '****************************************** Running' $script
   date >> build-and-test-everything.log
   echo '****************************************** Running' $script >> build-and-test-everything.log

   (cd $(dirname $script) ; ./$(basename $script) ) | tee -a build-and-test-everything.log
done

echo 'Finished successfully!!!'
