# https://github.com/danchitnis/container-xrdp

FROM centos:7
RUN yum -y update

# 下载chrome 
RUN yum install kde-l10n-Chinese glibc-common git wget telnet -y  \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm \
    && yum localinstall google-chrome-stable_current_x86_64.rpm -y 

# 配置 uirecorder
COPY ./build/package.json ./ 

RUN curl -sL https://rpm.nodesource.com/setup_10.x |  bash - \
    && yum install  nodejs java-1.8.0-openjdk-headless.x86_64  -y \
    && npm install -g --force --allow-root --unsafe-perm \
    && npm install uirecorder mocha macaca-reporter macaca-mocha-parallel-tests -g --force --allow-root --unsafe-perm

# 配置xrdp
RUN bash -c 'echo PREFERRED=/usr/bin/xfce4-session > /etc/sysconfig/desktop' \
    && yum -y install epel-release \
    && yum -y groupinstall xfce \
    && yum install -y xrdp xorgxrdp \
    && yum -y install  sudo nload passwd nano

WORKDIR  /etc/xrdp
COPY ./build/* ./

RUN mv ./startwm-xfce.sh ./startwm.sh \
    && chmod a+x ./startwm.sh  ./run.sh ./adduser.sh ./Run.sh 
    # && bash ./adduser.sh 

# 安装vscode
RUN bash -c 'rpm --import https://packages.microsoft.com/keys/microsoft.asc' \
    && bash -c ' cat ./vscode > /etc/yum.repos.d/vscode.repo ' \
    && yum install code -y 

#设置环境为zh_CN
RUN yum install -y cjkuni* fcitx \
    && localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 \
    && export LANG=zh_CN.UTF-8 \
    &&  echo "export LANG=zh_CN.UTF-8" >> /etc/locale.conf
ENV LANG zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8

EXPOSE 3389

ENTRYPOINT ["./Run.sh"]