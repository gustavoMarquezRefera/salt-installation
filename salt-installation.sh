sudo rpm --import https://repo.saltproject.io/salt/py3/amazon/2/x86_64/SALT-PROJECT-GPG-PUBKEY-2023.pub
curl -fsSL https://repo.saltproject.io/salt/py3/amazon/2/x86_64/latest.repo | sudo tee /etc/yum.repos.d/salt-amzn.repo
sudo yum install salt-minion -y
cd /etc/salt/minion.d
touch minion.conf
cat <<EOF > minion.conf
master: 172.16.0.7
master_port: 4506
EOF
sudo systemctl enable salt-minion && sudo systemctl start salt-minion
