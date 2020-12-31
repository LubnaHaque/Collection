# Installing
#### wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
#### sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main" > /etc/apt/sources.list.d/PostgreSQL.list'
#### sudo apt update
#### sudo apt-get install postgresql-10
# To check
#### which psql (output: /usr/bin/psql directory)
#### psql --version (output: psql (PostgreSQL) 10.15 (Ubuntu 10.15-1.pgdg16.04+1))
# Change postgres user's password
#### ALTER USER postgres PASSWORD 'newPassword';
# Accessing 
#### 1.
###### sudo su -l postgres
###### psql
#### 2. sudo -u USERNAME psql DATABASENAE
# Removing
#### sudo apt-get --purge remove postgresql
#### dpkg -l | grep postgres
#### sudo apt-get --purge remove postgresql postgresql-doc postgresql-common
# others command
#### CREATE DATABASE DATABASENAME;
#### \l (list of databases)
#### \q (quit)
#### \connect DATABASENAME (switch database)
#### \conninfo (connection info)
#### \dt (list of tables)
# Important links
#### 1. https://websiteforstudents.com/installing-postgresql-10-on-ubuntu-16-04-17-10-18-04/
#### 2. https://www3.ntu.edu.sg/home/ehchua/programming/sql/PostgreSQL_GetStarted.html
