# compose-collection

This repository contains Docker Compose files for deploy some services.

## Table of Contents

- [Getting Started](#getting-started)
- [Usage](#usage)
- [Services](#services)
	- [openvpn](#openvpn)
	- [nginx](#nginx)
	- [cmdbuild](#cmdbuild)
	- [gitlab](#gitlab)
	- [pgadmin](#pgadmin)
	- [vcenter](#vcenter)


## Getting Started

Clone the repository:

```
git clone https://github.com/vdbogdanov/compose-collection.git
```

## Usage

Open folder with service:

```
cd compose-collection/services/<service_folder>
```

Configure service with .env file:

```
nano .env
```

Start docker compose file:

```
docker compose up -d
``` 

## Services

If you want use service with custom config, you should change .env file in folder with service.

### [openvpn](services/openvpn/)

Deploy OpenVPN and generate .ovpn config on desktop.

Generate openvpn configuration:

```
docker compose run openvpn ovpn_genconfig -u udp://<server_ip>:1194
```

Generate openvpn pki certificates:

```
docker compose run --rm openvpn ovpn_initpki
```

Add openvpn clent:

```
docker compose run --rm openvpn easyrsa build-client-full <client_name>
```

Get openvpn client profile:

```
docker compose run --rm openvpn ovpn_getclient <client_name> > <client_name>.ovpn
```

### [nginx](services/nginx/)

Deploy Nginx as reverse proxy with HTTPS protocol. In my case for gitlab, pgadmin and vcenter docker containers, but you can change `/roles/nginx/files/templates/nginx.conf.template` according to your needs. Unlike previous nginx services, reverse proxy requires a domain name and certificates to establish an HTTPS connection (you can modify the nginx configuration to use the HTTP protocol). Certificates must be located in `/etc/letsencrypt` with names: `fullchain.pem` and `privkey.pem`.

### [cmdbuild](services/cmdbuild/)

Deploy CMDBuild base on `http://<server_ip>:80/cmdbuild` where `username = cmdbuild` and `password = cmdbuild`.

### [gitlab](services/gitlab/)

Deploy Gitlab service on `http://<server_ip>:80` and `ssh_port = 2224` where `username = root`, for get `password` you should run this command in terminal:

```
docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password
```

### [pgadmin](services/pgadmin/)

Deploy pgAdmin on `http://<server_ip>:80` where `username = admin@github.com` and `password = admin`.

### [vcenter]()

Deploy vcsim - vcenter simulator in docker container `nimmis/vcsim`. If you want use it via HTTP, you should use official container. You can test connection on `https://<server_ip>:80/about`.