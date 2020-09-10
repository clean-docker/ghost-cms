# Ghost CMS + Docker Compose

These are some reassons why use this Docker Compose in your production environment.

☝️ 2 command to install

👨‍💻 Ready to production and local development

⚡ Performance Optimized

🔒 SSL auto-renewed

## Stack

- Ubuntu 20.04 LTS or Centos 8
- Ghost CMS lastest docker image(alpine)
- MariaDB latest docker image
- Nginx latest docker image(alpine)
- Letsencrypt latest docker image
- Docker
- Docker-compose

## How start using this source?

Make sure that your `domain` and `www.domain` are pointing to your server IP.

Then copy this command below and **change the mydomain.com to your domain** and **change the email@email.com to your email address** and run it inside your new server. 

### For Ubuntu 20.04 LTS users

```bash
sudo apt update -y && sudo apt upgrade -y && sudo apt install curl git cron -y && sudo apt autoremove -y
```

```bash
curl -s https://raw.githubusercontent.com/woosungchoi/ghost-cms/master/dc | bash -s setup mydomain.com email@email.com
```

### For Centos 8 users

```bash
sudo yum -y update && sudo yum install -y curl git crontabs
```

```bash
curl -s dcc https://raw.githubusercontent.com/woosungchoi/ghost-cms/master/dcc | bash -s setup mydomain.com email@email.com
```

## How start using localhost or non ssl environments?

### For Ubuntu 20.04 LTS users

```bash
sudo apt update -y && sudo apt upgrade -y && sudo apt install curl git -y && sudo apt autoremove -y
```

```bash
curl -o dcl https://raw.githubusercontent.com/woosungchoi/ghost-cms/master/dcl && bash dcl setup && rm -f dcl
```

### For Centos 8 users

```bash
sudo yum -y update && sudo yum install -y curl git
```

```bash
curl -o dccl https://raw.githubusercontent.com/woosungchoi/ghost-cms/master/dccl && bash dccl setup && rm -f dccl
```

🎉Done! Access your http://localhost:your_port/ghost or http://your_domain:your_port/ghost to access the admin panel and create your account.

## Commands

| Commands  | Description  |
|---|---|
| `./dc start`  | Start your containers  |
| `./dc stop`  | Stop all containers  |
| `./dc update`  | Get Ghost updates and restart containers |

Thank you all [contributor](https://github.com/clean-docker/ghost-cms/graphs/contributors)!
