# Ghost CMS + Docker Compose

These are some reassons why use this Docker Compose in your production environment.

☝️ 1 command to install

👨‍💻 Ready to production and local development

⚡ Performance Optimized

🔒 SSL auto-renewed

## Stack

- Ghost CMS (Last version)
- MySQL 5.7
- NGINX
- Docker

## How start using [Digital Ocean](https://m.do.co/c/c3a8c6b3f90b)?

You can prepare a simple [$5 Droplet](https://m.do.co/c/c3a8c6b3f90b) to run it, using [my link](https://m.do.co/c/c3a8c6b3f90b) I'm giving $100 to start your server.

Then copy this command below and **change the mydomain.com to your domain** and run it inside your new server. Make sure that your domain is pointing to your server IP.

```bash
sudo apt update -y && sudo apt install curl git -y
curl -s https://raw.githubusercontent.com/woosungchoi/ghost-cms/master/dc | bash -s setup mydomain.com
```

## How start using locally?

In your local environment you need to have installed:

- Docker
- Docker Compose

After clone this repository, you can access the `dev` folder to be able to run the local dev environment using this command below.

```bash
git clone https://github.com/clean-docker/ghost-cms.git ghost
cd ghost/dev
docker-compose up -d
```

🎉Done! Access your https://localhost/ghost to access the admin panel and create your account.

## Commands

| Commands  | Description  |
|---|---|
| `./dc start`  | Start your containers  |
| `./dc stop`  | Stop all containers  |
| `./dc update`  | Get Ghost updates and restart containers |

Thank you all [contributor](https://github.com/woosungchoi/ghost-cms/graphs/contributors)!
