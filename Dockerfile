FROM jenkins:1.554.3
MAINTAINER iamseapy@gmail.com
ENV REFRESHED_AT 2014-07-25

# jenkins 이미지에서 user를 jenkins 로 바꾸고 있어서 다시 root로 변경
USER root

# Docker에 필요한 패키지 설치
RUN apt-get update -qq
RUN apt-get install -qqy iptables ca-certificates lxc

# Docker 저장소의 apt-get을 이용해 docker 설치
RUN apt-get install -qqy apt-transport-https
RUN echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
RUN apt-get update -qq
RUN curl https://get.docker.io/gpg | apt-key add -
RUN apt-get update -qq
RUN apt-get install -qqy lxc-docker

VOLUME /var/lib/docker

# Jenkins의 JVM 메모리를 늘린다
ENV JAVA_ARGS -Xms512m -Xmx1024m

ADD jenkins_dind.sh /usr/local/bin/jenkins_dind.sh
RUN chmod +x /usr/local/bin/jenkins_dind.sh

CMD ["/usr/local/bin/jenkins_dind.sh"]