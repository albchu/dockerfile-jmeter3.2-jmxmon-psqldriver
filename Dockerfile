FROM albchu/ubuntu-java8-python2-zip-wget-vim
MAINTAINER Albert Chu <albert.chu@replicon.com>

# Install jmeter
RUN mkdir /jmeter \
	&& cd /jmeter/ \
	&& wget http://apache.mirror.colo-serv.net//jmeter/binaries/apache-jmeter-3.2.tgz \
	&& tar -xzf apache-jmeter-3.2.tgz \
	&& rm apache-jmeter-3.2.tgz \
	&& mkdir /jmeter-plugins \
	&& cd /jmeter-plugins/ \
	&& wget https://jmeter-plugins.org/files/packages/jpgc-jmxmon-0.2.zip \
	&& unzip -o jpgc-jmxmon-0.2.zip  -d /jmeter/apache-jmeter-3.2/ \
	&& cd /jmeter/apache-jmeter-3.2/lib/ \
	&& wget https://jdbc.postgresql.org/download/postgresql-42.1.4.jar

# Set Jmeter Home
ENV JMETER_HOME /jmeter/apache-jmeter-3.2/

# Add Jmeter to the Path
ENV PATH $JMETER_HOME/bin:$PATH
