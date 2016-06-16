#!/bin/bash
#Assumes 6 Carte Slave Processes running
NUM_CARTE=6
NUM_DI=1
NUM_BI=1
NUM_PGSQL=1
PGSQL_PORT=5432
PGSQL_HOST="127.0.0.1"
CURRENT_USER=`whoami`
PENTAHO_HOME=/pentaho/
DI_SERV_THUMB="data-integration-server"
BA_SERV_THUMB="biserver-ee"
CARTE_THUMB="carte.sh"
PGSQL_THUMB="postgresql"
CTL_SCRIPT=$PENTAHO_HOME/ctlscript.sh
SLAVE_START=$PENTAHO_HOME/design-tools/data-integration/start_carte_slaves.sh
SLAVE_STOP=$PENTAHO_HOME/design-tools/data-integration/stop_carte_slaves.sh
PGSQL_STOP="$PENTAHO_HOME/postgresql/bin/pg_ctl stop -m fast"
