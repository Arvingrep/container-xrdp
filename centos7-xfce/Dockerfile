# https://github.com/danchitnis/container-xrdp

FROM centos:7
RUN yum -y update

RUN bash -c 'echo PREFERRED=/usr/bin/xfce4-session > /etc/sysconfig/desktop' \
    && yum -y install epel-release \
    && yum -y groupinstall xfce \
    && yum install -y xrdp xorgxrdp \
    && yum -y install  sudo nload passwd nano

WORKDIR  /etc/xrdp
COPY ./build/* /etc/xrdp/

RUN mv /etc/xrdp/startwm-xfce.sh /etc/xrdp/startwm.sh \
    && chmod a+x /etc/xrdp/startwm.sh \
    && chmod +x /etc/xrdp/run.sh

EXPOSE 3389

ENTRYPOINT ["/etc/xrdp/run.sh"]

