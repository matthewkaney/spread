#Install Code Server and set it up to run automatically

# Delete build of Code Server
sudo rm -rf /usr/local/codeserver

# Get info for code-server 3.0.0
URL="https://github.com/cdr/code-server/releases/download/3.0.0/code-server-3.0.0-linux-x86_64.tar.gz"

BUNDLE=$(basename "$URL")
FOLDER=${BUNDLE::-7}

# Download and extract build
wget $URL
tar xvf $BUNDLE
rm $BUNDLE

# Move files to bin folder
sudo mkdir -p /usr/local/codeserver
sudo mv $FOLDER/* /usr/local/codeserver
rm -r $FOLDER

# Replace assets
cp /usr/local/spread/resources/codeserver/media/* /usr/local/codeserver/src/browser/media/

# Set up Symlink
sudo ln -sf /usr/local/codeserver/code-server /usr/local/bin/code-server

# Create startup script
sudo cp /usr/local/spread/resources/codeserver/startup.sh /etc/init.d/codeserver
sudo chmod 755 /etc/init.d/codeserver
sudo update-rc.d codeserver defaults

# Run Code Server
/usr/local/bin/code-server --auth none --port 12000