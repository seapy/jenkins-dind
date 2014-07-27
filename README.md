jenkins-dind
============

Jenkins with Docker In Docker. for Docker build in Jenkins


How to run
==========

```shell
$ mkdir -p /docker/jenkins_dind
$ docker run -p 8080:8080 -v /docker/jenkins_dind:/var/jenkins_home --privileged seapy/jenkins-dind:1.554.3
```
