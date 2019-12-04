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
7. Once connected, you'll want to create a new query. You can copy everything from [here](https://raw.githubusercontent.com/AlaynaGrace/ICS311-Project-Step4/master/database/data.sql) and run it. This will create the database, create the tables, and insert some data.

The database should be all set up now! Let's get the app running.

### Setting up the application
1. This application uses Node.js as a package manager. If you don't have Node.js, you can install it [from here](https://nodejs.org/en/download/).
2. Once you have Node installed, pull up a terminal or command prompt window and `cd` into the directory where you have the code.
3. Run `npm install` in the terminal to get all of the packages.
4. Before starting the application, you'll have to update the connection. You can do this by going into `server/routes/routes.js` and updating lines 9-11.
4. Run `npm start` in the terminal to run the application.
5. To see the application, you can go to `localhost:3003`.

## How I set it up
Most of the steps will look somewhat similar. I still have to set up the database and set up the application. I also had to set up the VM for it to run.

### Setting up the VM
I really like using Google Cloud for getting compute quickly. If you haven't used Google Cloud before, you should get some free credits to start out. To get the right VM, I:
1. From the front page of Google Cloud, I clicked the Navigation bar on the top right and went to `Compute Engine` > `VM Instances`. When you first load this, it takes a minute or two.
2. I then selected `Create`.
3. From here, there are a lot of option. The most important one is the OS. Mid-way down the page, you'll see a `Boot disk` option and it has `Debian GNU/Linux 9 (stretch)` selected. Click `Change` and look for `Container-Optimized OS 77-12371.114.0 stable`. This is the most recent stable version of this image.
4. In the `Firewall` section, I selected both `Allow HTTP Traffic` and `Allow HTTPS Traffic`. I originally thought I'd have time to get a cool domain name picked out so this option made sense. We will need to open up more ports later so that we can reach the application.
5. Click `Create`. This could take a minute or two.
6. Once it's been created, you'll see an option on the right that says `SSH`. Click that and a terminal window will pop up in your browser.

### Setting up the database
To make things easier, I use Docker containers. Instead of having to set up an entire database, we can just pull one from Dockerhub.
1. In the terminal window, run `docker pull mysql:5`. This pulls down the mysql version 5 image.
2. To get the database running, run `docker run --name mysqldb -d -p 3306:3306 -e -e MYSQL_ROOT_PASSWORD=your-secret-password mysql:5`. This will start the mysql database in a container and let you access it from port 3306.
3. Now, we will have to set up the database. You can get into the container by running `docker exec -ti mysqldb /bin/bash`.
4. From here, I ran `mysql -u root -p`. This prompts for a password and then leads me to the mysql cli session.
5. Same as before, you can copy everything from [here](https://raw.githubusercontent.com/AlaynaGrace/ICS311-Project-Step4/master/database/data.sql) and paste it into the terminal. You will have to hit enter again at the end for the last line to go through.
6. The database is all set up! To exit the msql command line you can run `\q` and to exit the container you can run `exit`.

### Setting up the application
To make things easier, I've put my code into GitHub. 
1. Run `git clone https://github.com/AlaynaGrace/ICS311-Project-Step4.git`
2. Run `cd ICS311-Project-Step4`
3. Run `docker build -t project .`
4. Run `docker run -p 3003:3003 project`
5. Back in the Google Cloud console. Go back to the VM instances page. You should see an `External IP` option. Take that IP, put it in your browswer, and add `:3003` to it. For example, my assigned IP is `34.70.109.84`. So to visit my application instance, I go to `34.70.109.84:3003`.
6. If it doesn't show up, there's two things we can do:
    * On the left, go to `VPC network` > `Firewall rules`. I created a rule that allowed all ports in range `0.0.0.0/0`. (I know, not super secure but for a demo its fine)
    * If that doesn't fix it, I also turned my External IP from Ephemeral to Static.Under `VPC network` you can go to `External IP addresses`, find the one that you are using, and updated it so that it is Static. This just keeps it from changing. 