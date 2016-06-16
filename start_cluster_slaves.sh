#!/bin/sh
CURRENT_USER=`whoami`
if [[ "$CURRENT_USER" != "pentaho" ]]; then
        echo "Running this as any user other than pentaho will cause serious harm. Please su - pentaho" 2>&1
        exit 1
fi

NORMAL_SLAVES=4
export KETTLE_HOME=/home/pentaho

cd /pentaho/pentaho/design-tools/data-integration
#normal slaves
for (( slave=1; slave<=$NORMAL_SLAVES; slave++ ))
do
        ./carte.sh carte-slave0$slave-config.xml > /pentaho/pentaho/server/data-integration-server/logs/slaves/slave0$slave.log 2>&1 &
done
#async slave
./carte.sh carte-slave-async-config.xml > /pentaho/pentaho/server/data-integration-server/logs/slaves/slave-async.log 2>&1 &
#sequence slave
./carte.sh carte-slave-sequence-config.xml > /pentaho/pentaho/server/data-integration-server/logs/slaves/slave-sequence.log 2>&1 &

exit 0
