FROM ubuntu:focal

COPY ./config/render.conf /render.conf

WORKDIR /app/build

RUN apt -y update && \
    apt -y upgrade && \
    apt -y install git python3 build-essential python3-pil python3-dev python3-numpy wget && \
    mkdir -p ~/.minecraft/versions/1.19/ && \
    wget https://overviewer.org/textures/1.19 -O ~/.minecraft/versions/1.19/1.19.jar && \
    git clone https://github.com/overviewer/Minecraft-Overviewer.git && \
    cd Minecraft-Overviewer/ && \
    python3 setup.py build && \
    python3 setup.py install && \
    cd ..

CMD ["overviewer.py", "--config=/render.conf", "--processes=6"]
