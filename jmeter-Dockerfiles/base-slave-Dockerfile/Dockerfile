FROM ubuntu

MAINTAINER Softcrylic
		
ARG JMETER_VERSION=5.0
		
RUN apt-get clean && \
apt-get update -y && \
apt-get -y install \
wget \
telnet \
iputils-ping \
sudo \
curl \
vim \
unzip

RUN apt-get install software-properties-common -y \
&& add-apt-repository ppa:webupd8team/java -y \
&&  apt-get update -y \
&& echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
&& apt-get install oracle-java8-installer -y \
&& apt-get install oracle-java8-set-default -y 

ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle

RUN   mkdir /jmeter \
&& cd /jmeter/ \
&& wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-$JMETER_VERSION.tgz \
&& tar -xzf apache-jmeter-$JMETER_VERSION.tgz \
&& rm apache-jmeter-$JMETER_VERSION.tgz

RUN cd /jmeter/apache-jmeter-$JMETER_VERSION/ && wget -q -O /tmp/JMeterPlugins-Standard-1.4.0.zip https://jmeter-plugins.org/downloads/file/JMeterPlugins-Standard-1.4.0.zip && unzip -n /tmp/JMeterPlugins-Standard-1.4.0.zip && rm /tmp/JMeterPlugins-Standard-1.4.0.zip

COPY JMeter-InfluxDB-Writer-plugin-1.2.jar  /jmeter/apache-jmeter-$JMETER_VERSION/lib/ext 
COPY jmeter-parallel-0.4.jar  /jmeter/apache-jmeter-$JMETER_VERSION/lib/ext 
COPY jmeter-plugins-manager-0.20.jar  /jmeter/apache-jmeter-$JMETER_VERSION/lib/ext 
COPY jmeter-plugins-random-csv-data-set-0.6.jar /jmeter/apache-jmeter-$JMETER_VERSION/lib/ext

COPY entrypoint.sh /bin/

RUN   apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install -y gnupg2 \
&& curl -L https://toolbelt.treasuredata.com/sh/install-ubuntu-bionic-td-agent3.sh | sh \
&& /usr/sbin/td-agent-gem install elasticsearch 

EXPOSE 24224 5140

ENV JMETER_HOME /jmeter/apache-jmeter-$JMETER_VERSION/
		
ENV PATH $JMETER_HOME/bin:$PATH

#ENTRYPOINT ["/bin/entrypoint.sh"]
