[![Waffle.io - Issues in progress](https://badge.waffle.io/BaobabHealthTrust/evr_stats_konsole.png?label=in%20progress&title=In%20Progress)](http://waffle.io/BaobabHealthTrust/evr_stats_konsole)

# EVR STATS KONSOLE

# DESCRIPTION
A Statistics monitoring tool for the eVR (Electronic Village Register) Application. Includes a dashboard and various reports, in form of charts, tables, and raw data. 

# TABLE OF CONTENTS

# DEPENDENCIES

## Ruby

    version 2.50p0 +

## Rails

    versions 5.1.6 +

# SETTING UP

## Clone the repository from github

### SSH:

    git@github.com:BaobabHealthTrust/evr_stats_konsole.git

### HTTPS:

    https://github.com/BaobabHealthTrust/evr_stats_konsole.git

# INSTALLATION
Install the gem and all dependent pakages using the following command:

    bundle

# USAGE

Copy the couchdb configuration example file to a new file and make your configurations point to the EVR couchdb. Copy by using the command below:

    cp config/couchdb.yml.example config/couchdb.yml

### Run the Application

Run the application to use it, by running any of the following commands:

##### Using Passenger

    passenger start

##### Using Puma

    rails s

Open a web browser and access the link below

    localhost:3000    

# CONTRIBUTING

### For contributors and contributing stats follow the link below:

https://github.com/BaobabHealthTrust/evr_stats_konsole/graphs/contributors

# CREDITS

# LICENSE
Read more on the license in the LICENSE file in the repos root
                    GNU GENERAL PUBLIC LICENSE
                       Version 3, 29 June 2007