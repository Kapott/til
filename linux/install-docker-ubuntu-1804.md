# Install docker on ubuntu 18.04

```bash
sudo apt update && 
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common &&
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" &&
sudo apt update &&
sudo apt install -y docker-ce &&
sudo systemctl status docker
```

After installation, if docker has to start when the server starts:

```
sudo systemctl enable docker
```