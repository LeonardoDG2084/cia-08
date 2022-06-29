#! /bin/bash
yum update
amazon-linux-extras install docker
service docker start
usermod -a -G docker ec2-user
docker run --env MONGODB_SERVER=${mongodb_server} --restart always -p 80:${port} leonardodg2084/${image}:${version}