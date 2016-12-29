#!/bin/bash

echo "========>>Checking/Installing glibc Libraries required for jdk"

if [ -f "rpm -qa | grep glibc" ]; then
yum install glibc.i686 -y
fi
if [ -f "rpm -qa | grep libgcc" ]; then
yum install libgcc-* -y
fi

cd /opt/

echo "========>>Downloading JDK package"
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25-linux-x64.tar.gz"

echo "========>>Extracting JDK package and setting JAVA_HOME and PATH env variables"
mkdir -p /usr/java
sudo tar xzf jdk-8u25-linux-x64.tar.gz -C /usr/java

export JAVA_HOME=/usr/java/jdk1.8.0_25/
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$PATH:$JAVA_HOME/bin

echo "========>>Putting JAVA_HOME variable in bashrc file"
echo "export JAVA_HOME=/usr/java/jdk1.8.0_25/">> ~/.bashrc
echo "export PATH=$JAVA_HOME/bin:$PATH">> ~/.bashrc
echo "export PATH=$PATH:$JAVA_HOME/bin">> ~/.bashrc

echo "========>>Checking Java Version"
java -version

echo "========>>Downloading apache tomcat package"
cd /opt/
wget http://redrockdigimark.com/apachemirror/tomcat/tomcat-8/v8.5.9/bin/apache-tomcat-8.5.9.tar.gz

echo "========>>Extracting apache tomcat package and setting CATALINA_HOME env variables"
tar zxf apache-tomcat-8.5.9.tar.gz
cd /opt/apache-tomcat-8.5.9/
export CATALINA_HOME=/opt/apache-tomcat-8.5.9/
export CATALINA_BASE=$CATALINA_HOME
echo "========>>Exporting Tomcat Variables in bashrc file"
echo "export CATALINA_HOME=/opt/apache-tomcat-8.5.9/">> ~/.bashrc
echo "export CATALINA_BASE=$CATALINA_HOME">> ~/.bashrc

echo "========>>Checking Tomcat Versin and starting tomcat server"
$CATALINA_HOME/bin/version.sh
$CATALINA_HOME/bin/startup.sh
/bin/sleep 20
echo "========>>Checking if tomcat server is started at port 8080"
curl -I http://localhost:8080