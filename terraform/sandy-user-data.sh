#! /bin/bash
sudo mkdir /opt/sandy
sudo mkfs -t ext4 /dev/xvdba
sudo bash -c 'echo "/dev/xvdba /opt/sandy ext4 defaults 0 0" >> /etc/fstab'
sudo mount -a
sudo chown ubuntu:ubuntu /opt/sandy

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw --enforce enable 

sudo git clone https://gsin0080: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@github.com/gsin0080/mysandbox.git /tmp/sandy

sudo apt-get update
sudo apt-get -y remove docker docker-engine docker.io containerd runc
sudo apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg    
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose

sudo apt-get -y install python3-pip

pip3 install -r /tmp/sandy/api/requirements.txt
sudo cp -r /tmp/sandy/api /opt/sandy/api
sudo cp -r /tmp/sandy/nginx /opt/sandy/nginx
sudo chown -R ubuntu:ubuntu /opt/sandy


cd /opt/sandy/nginx
sudo docker compose up -d

nohup python3 /opt/sandy/api/api.py &

sudo crontab -l > cron_bkp
sudo echo "* * * * * /opt/sandy/api/healthcheck.sh >> /opt/sandy/api/resource.log 2>&1" >> cron_bkp
sudo crontab cron_bkp
sudo rm cron_bkp