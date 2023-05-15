docker-compose.yaml
version: '3.5'

services:
  inference:
    build:
      context: .
      dockerfile: Dockerfile
    image: test_pytorch_deepstream:0.1
    stdin_open: true # docker run -i
    container_name: docker-test
    hostname: docker.dgx

    environment:
      - DISPLAY=${DISPLAY}
      - ROOTDIT=RDR

    volumes:
      - type: bind
        source: /tmp/.X11-unix
        target: /tmp/.X11-unix
      - type: bind
        source: $HOME/.Xauthority
        target: /root/.Xauthority
  

    network_mode: "host"
