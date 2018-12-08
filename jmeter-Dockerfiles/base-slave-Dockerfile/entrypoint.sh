#!/bin/bash

service td-agent start

/jmeter/apache-jmeter-$JMETER_VERSION/bin/jmeter-server -Dserver.rmi.localport=50000 -Dserver_port=1099 -Jserver.rmi.ssl.disable=true
