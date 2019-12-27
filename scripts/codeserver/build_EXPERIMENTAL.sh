# Install Node
# Install Yarn

sudo apt-get install -y build-essential pkg-config libx11-dev libxkbfile-dev libsecret-1-dev fakeroot rpm

# Install Python 2.7 which is required for now
sudo apt-get install python2.7

# Source NVM
. ~/.config/nvm/nvm.sh

nvm --version
nvm install 10
nvm use 10

git clone https://github.com/cdr/code-server.git ~/TEMP/code-server
cd ~/TEMP/code-server
yarn install

yarn build 1.39.2 2
yarn binary 1.39.2 2

nvm use node
