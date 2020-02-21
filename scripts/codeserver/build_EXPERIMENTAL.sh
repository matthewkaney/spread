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

rm -rf ~/TEMP/code-server
git clone https://github.com/cdr/code-server.git ~/TEMP/code-server
cd ~/TEMP/code-server

LATEST=`git describe --tags --abbrev=0`
VSC_VERSION=`echo $LATEST | sed -n 's/.*vsc\(.*\)/\1/p'`

# Switch to latest tagged version (assuming only releases are tagged)
git checkout tags/$LATEST

yarn install

echo $VSC_VERSION

yarn build $VSC_VERSION 2
yarn binary $VSC_VERSION 2

nvm use node
