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

```bash
git clone https://github.com/vdbogdanov/compose-collection.git
```

## Usage

Open folder with service:

```bash
cd compose-collection/services/<service_folder>
```

Configure service with .env file:

```bash
nano .env
```

Start docker compose file:

```bash
docker compose up -d
``` 

## Services

### [openvpn](services/openvpn/)

Deploy OpenVPN and generate .ovpn config on desktop.

.env file:

```
OVPN_PORT=1194 – pasword for generated config
```

### [nginx](services/nginx/)



### [cmdbuild](services/cmdbuild/)



### [gitlab](services/gitlab/)



### [pgadmin](services/pgadmin/)



### [vcenter]()

