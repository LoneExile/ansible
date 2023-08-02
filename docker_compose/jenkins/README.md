[https://stackoverflow.com/questions/47709208/how-to-find-docker-host-uri-to-be-used-in-jenkins-docker-plugin](https://stackoverflow.com/questions/47709208/how-to-find-docker-host-uri-to-be-used-in-jenkins-docker-plugin)

set up jenkins cloud with docker `tcp://<ip>:2375`

```bash

docker run -d --restart=always -p 8080:8080 -p 50000:50000 --network jenkins -v ./var/jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk11

docker run -d --restart=always -p 127.0.0.1:2376:2375 --network jenkins -v /var/run/docker.sock:/var/run/docker.sock alpine/socat tcp-listen:2375,fork,reuseaddr unix-connect:/var/run/docker.sock

```
