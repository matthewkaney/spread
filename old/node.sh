#Install node.js via nodesource

echo "Installing Node"

#Update
sudo apt update && sudo apt upgrade -y

#Install Node
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs

#Install updates to NPM
sudo npm install npm -g
