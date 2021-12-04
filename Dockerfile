FROM centos:7

COPY ./config/render.conf /render.conf

RUN yum -y update && \
    yum -y install wget && \
    yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    wget -O /etc/yum.repos.d/overviewer.repo https://overviewer.org/rpms/overviewer.repo && \
    mkdir -p ~/.minecraft/versions/1.18/ && \
    wget https://overviewer.org/textures/1.18 -O ~/.minecraft/versions/1.18/1.18.jar && \
    yum -y update && \
    yum -y install Minecraft-Overviewer

CMD ["overviewer.py", "--config=/render.conf", "--processes=6"]
