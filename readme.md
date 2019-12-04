# ICS 311 Project 4
If you'd like to take a look without all the set up work, you can click [here](http://34.70.109.84:3003/).
## Set up
There are two steps to setting up this project:
1. Setting up the database
2. Setting up the application

I did things a bit different, and will detail that process as well. The instructions I give will be how to get it running locally.

### Setting up the database
1. If you don't already have a MySQL database set up, you can follow [these instructions](https://dev.mysql.com/doc/mysql-installation-excerpt/5.7/en/installing.html).
2. You will also want to use MySQL Workbench. You can follow the instructions [here](https://dev.mysql.com/doc/workbench/en/wb-installing-windows.html) to get that installed.
3. Once you have MySQL Workbench installed, you will want to open it and make a new connection. You can do this by going to `Database` > `Connect to Database` or `Ctrl+U`.
4. You can set `Connection Name` to anything you want.
5. The rest should be the same if you set your database up locally. You can click `Test Connection` to make sure that it connects. If it connects, click `OK`.
6. To connect to your database, you can double click the card that has your connection name. You will have to enter the root password before continuing.
7. Once connected, you'll want to create a new query. You can copy everything from [here]() and run it. This will create the database, create the tables, and insert some data.