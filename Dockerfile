FROM ubuntu:focal

ENV VERSION 1.20

RUN apt -y update && \
    apt -y upgrade && \
    apt -y install git python3 build-essential python3-pil python3-dev python3-numpy wget && \
    git clone https://github.com/overviewer/Minecraft-Overviewer.git && \
    cd Minecraft-Overviewer/ && \
    python3 setup.py build && \
    python3 setup.py install && \
    cd .. && \
    groupadd user -g 1000 && \
    useradd -m user -u 1000 -g 1000

USER user

WORKDIR /home/user

RUN mkdir -p ~/.minecraft/versions/$VERSION/ && \
    wget https://overviewer.org/textures/$VERSION -O ~/.minecraft/versions/$VERSION/$VERSION.jar

COPY ./config/render.conf render.conf

CMD ["overviewer.py", "--config=render.conf", "--processes=6"]
