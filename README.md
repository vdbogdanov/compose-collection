# compose-collection

This repository contains Docker Compose files for deploy some services.

## Table of Contents
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

### [openvpn](services/openvpn/)

Deploy OpenVPN and generate .ovpn config on desktop.

```
.env file vars:

OVPN_PORT – port for openvpn container
```

Generate openvpn configuration:

```
docker compose run openvpn ovpn_genconfig -u udp://<server_ip>:<ovpn_port>
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

```
.env file vars:


```


### [cmdbuild](services/cmdbuild/)

```
.env file vars:


```



### [gitlab](services/gitlab/)

```
.env file vars:


```



### [pgadmin](services/pgadmin/)

```
.env file vars:


```



### [vcenter]()

```
.env file vars:


```

