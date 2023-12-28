# docker: laravel_10x-msql-phpmyadmin
This is a tutorial for installing a docker services and have a local enviroment for your application. This tutorial is for Linux.
Dependencies:
You need docker installed = https://docs.docker.com/compose/install/linux/#install-using-the-repository

First you have to "BUILD" three docker containers: one for Laravel, one for Mysql, and the last for PhpMyAdmin.

The Laravel container you can build with the Dockerfile, you have to be in the same folder where you put the Dockerfile. Open the terminal and execute this command
docker build -t laravel:10x .
With this command you are going to download the debian container, then the Dockerfile is going to execute the  install script. If you inspect it, the file will install all the dependencies necesaries for this version of Laravel, and also the necesary plugins for the database and the connection.
The install occurs inside the container so you don't hace to worry about your computer.

The next step is to download the latest version of the mysql container, so you have to execute the next command line:
docker pull mysql:latest
