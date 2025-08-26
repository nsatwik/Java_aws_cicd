#!/bin/bash
# Deploy WAR and start Tomcat
echo "Deploying WAR..."
cp /opt/tomcat/webapps/app.war /opt/tomcat/webapps/
echo "Starting Tomcat server..."
/opt/tomcat/bin/shutdown.sh
/opt/tomcat/bin/startup.sh
echo "Tomcat started and app deployed."
