# Akka Http Proxy

Proxy for use with Akka's dockerized development environment.

## Install dependencies

- [Docker Desktop](#docker-desktop)
- [git](#git)
- [mkcert](#mkcert)
- [gh](#gh)

In this readme we suggest installing the dependencies (except for Docker) with Homebrew. This is not a requirement.

### Docker Desktop

https://www.docker.com/products/docker-desktop/

For faster file system operations in Docker (on Mac OS), there is a setting that your should activate in Docker desktop.

Docker Dektop > Preferences ⚙ > Experimental Features 

Activate *Enable VirtioFS accelerated directory sharing*.

### git

You probably have git :)

### mkcert

https://github.com/FiloSottile/mkcert

`brew install mkcert`

### gh

https://cli.github.com/manual/installation

`brew install gh`

## First time setup

After installing dependencies, these steps need to be done whenever you want to use the proxy with a new project.

### Local certificates

We use self signed certificates for `*.[domain].test`. On Mac we can use `mkcert` to create local certifiactes.

Certificates are created for domains that you have specified in domains.mk

```
cp domains.mk.example domains.mk
```

Enter the domains you want to use with the proxy in domains.mk. After this you can create your certs:

```
# Create a root certificate
mkcert -install

# Create your .test certificates
make cert
```

### Add domains to the hosts file on your computer

In /etc/hosts (on Mac):

```
127.0.0.1 cms.example-domain.test
127.0.0.1 www.example-domain.test
```

### Github cli

Sign in to the Github command line client (this is used to download modules from Github Packages and to download seed data).

```
gh auth status
gh auth login
```

## Start proxy

Traefik is used to route http(s) trafic to the correct container.

```
make up
```
