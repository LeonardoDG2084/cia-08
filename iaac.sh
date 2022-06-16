apt update
apt dist-upgrade -y
apt install -y git git-flow docker.io docker-compose awscli gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt update && apt install terraform -y
