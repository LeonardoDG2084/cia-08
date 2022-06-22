#! /bin/bash
yum update
amazon-linux-extras install docker
service docker start
usermod -a -G docker ec2-user
docker run -p 27017:27017 --name slacko-mongodb -d mongo:5.0.2