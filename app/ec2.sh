#! /bin/bash
yum update
amazon-linux-extras install docker
service docker start
usermod -a -G docker ec2-user
docker run --restart always -p 80:8000 leonardodg2084/skacko-api:1.1.0