# Drone

Version 0.6 of `drone-server` and `drone-client` install using docker-copmose

## Installing / Getting started

### Centos
You need to have `git` installed and configured.

Install `docker` and `docker-compose`:
```shell
git clone git@github.com:pawniemiec/tools.git
./tools/centos/docker-install.sh
```

### Other OSes
Check this out: https://docs.docker.com/install/

And: https://docs.docker.com/compose/install/


## Configuration

You need to set the following variables:
```
export DRONE_GITHUB_CLIENT=yellowfrog
export DRONE_GITHUB_SECRET=I_hate_storks!
export DRONE_SECRET=Not_true_I_love_storks!!!
export DRONE_HOST=https://drone.yellowfrog.ioioio
```

### Building, starting and testing

```shell
make build
make start
```
These commands will download this repo, will build the docker images for `drone-server` and `drone-client`

### Testing 
```
make test
```


## Contributing

If you'd like to contribute, please fork the repository and use a feature
branch. Pull requests are warmly welcome.

More information in [`CONTRIBUTING.md`](./CONTRIBUTING.md)

## Links

- Project homepage: https://github.com/pawniemiec/tools
- Repository: https://github.com/pawniemiec/tools
- Issue tracker: https://github.com/pawniemiec/tools/issues
- In case of sensitive bugs like security vulnerabilities, please contact 
    pniemiec@noledgetech.com directly instead of using issue tracker.
    We value your effort to improve the security and privacy of this project!
- Related projects:
  - Your other project: https://github.com/pawniemiec/repo-template

## Licensing
The code in this project is licensed under this [`LICENSE`](./LICENSE.md)

## Prerequisites
This project is dependent on the following libs and programs:

## Makefile
- help:   shows all available targets
- build:  builds container image
- start:  start container
- test:   run all tests
- stop:   stops and removes container
