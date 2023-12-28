FROM debian:latest

WORKDIR /home/

COPY install.sh /home/
# COPY script.sh /home/

RUN chmod +x install.sh && sh ./install.sh

RUN useradd -rm -d /home/docker -G sudo -p $(openssl passwd -1 docker) -u 1000 docker && mkdir /home/docker/desarrollo

USER docker

WORKDIR /home/docker/desarrollo/

#RUN echo "alias iniciar='/root/./script.sh'" >> /home/docker/.bashrc

CMD ["bash"]
