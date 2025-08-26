#!/bin/bash
WAR_FILE=/opt/tomcat/webapps/app.war
if [ -f "$WAR_FILE" ]; then
    sudo systemctl stop tomcat
    sudo cp target/app.war /opt/tomcat/webapps/
    sudo systemctl start tomcat
fi
