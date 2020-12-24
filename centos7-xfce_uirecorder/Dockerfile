# https://github.com/danchitnis/container-xrdp

FROM centos:7

#配置 uirecorder 包含chrome 环境
RUN yum -y update \
    && yum install kde-l10n-Chinese glibc-common git wget -y  \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm \
    && yum localinstall google-chrome-stable_current_x86_64.rpm -y \
    && curl -sL https://rpm.nodesource.com/setup_10.x |  bash - \
    && yum install  nodejs -y \
    && npm install uirecorder mocha macaca-reporter -g --force --allow-root --unsafe-perm

RUN yum -y install epel-release

RUN yum -y groupinstall xfce

RUN bash -c 'echo PREFERRED=/usr/bin/xfce4-session > /etc/sysconfig/desktop'

RUN yum install -y xrdp xorgxrdp sudo nload passwd nano vim 


COPY ./build/ /etc/xrdp/


RUN mv /etc/xrdp/startwm-xfce.sh /etc/xrdp/startwm.sh \
    && chmod a+x /etc/xrdp/startwm.sh \
    && chmod  +x /etc/xrdp/Run.sh \
    && chmod +x /etc/xrdp/adduser.sh 

RUN  /usr/bin/bash  /etc/xrdp/adduser.sh

#设置环境为zh_CN
RUN yum install -y cjkuni*  \
    && localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 \
    && export LANG=zh_CN.UTF-8 \
    &&  echo "export LANG=zh_CN.UTF-8" >> /etc/locale.conf
ENV LANG zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8

EXPOSE 3389

ENTRYPOINT ["/etc/xrdp/Run.sh"]