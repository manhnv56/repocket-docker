# repocket-docker

Dockerized version of Repocket

## Usage

```sh
git clone https://github.com/FailedShack/repocket-docker
cd repocket-docker
docker-compose up
```

Open http://127.0.0.1:3000/vnc_auto.html in your browser and log in or [sign up](https://link.repocket.co/S2R8)

### Without vnc

```
docker-compose build
xhost local:docker
docker run --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY -d repocket
```
