FROM ubuntu:22.04

RUN apt update && apt install -y wget sudo

RUN useradd -ms /bin/bash anatole && echo "anatole ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers
USER anatole
WORKDIR /home/anatole

COPY . /home/anatole/.dotfiles

RUN cd ~/.dotfiles && ./install.sh

CMD ["/usr/bin/zsh"]
