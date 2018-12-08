FROM my/slave-base:latest

MAINTAINER Softcrylic
		
EXPOSE 1099 50000

ENV JMETER_VERSION 5.0

ENTRYPOINT ["/bin/entrypoint.sh"]
		
#ENTRYPOINT /jmeter/apache-jmeter-$JMETER_VERSION/bin/jmeter-server \
#-Dserver.rmi.localport=50000 \
#-Dserver_port=1099 \
#-Jserver.rmi.ssl.disable=true
