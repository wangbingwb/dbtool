@echo off
cd %cd%
start java -Dfile.encoding=UTF-8 -jar ${projectName}-0.0.1-SNAPSHOT.jar --spring.profiles.active=dev