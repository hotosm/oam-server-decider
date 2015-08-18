# OpenAerialMap Server: Decider component

The Decider component of OAM Server is a [swfr](http://github.com/stamen/swfr) SWF decider that processes OAM tiling workflows.

## Usage

The main avenue for developing against the OpenAerialMap (OAM) server is via Docker. To get started, ensure that you have a [working Docker environment](https://docs.docker.com/machine/), with version `>=1.7`. In addition, all interactions with Docker and NPM are wrapped within a `Makefile`.

In order to build this image, use the `activities` target:

```bash
$ make decider
Sending build context to Docker daemon  7.68 kB
Sending build context to Docker daemon

...

Successfully built e2666914b094
```

From there, you can start the server using the `start` target:

```bash
$ make start
b1d7b15d68632883ba81c6098719036caf3c4e23dff964666a42d736bee96a33
$ docker ps
CONTAINER ID        IMAGE                          COMMAND             CREATED             STATUS              PORTS                    NAMES
b1d7b15d6863        oam/server-decider:latest   "npm start"         19 seconds ago      Up 16 seconds       0.0.0.0:8000->8000/tcp   oam-server-decider
```

**Note**: For the `start` target, contents within the `activities` directory gets mounted inside of the container via a volume to ensure that the latest code changes are being tested.

