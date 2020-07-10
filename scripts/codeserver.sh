#Install Code Server and set it up to run automatically

# Delete build of Code Server
sudo rm -rf /usr/local/codeserver

# Get info for code-server 3.4.1
URL="https://github.com/cdr/code-server/releases/download/v3.4.1/code-server-3.4.1-linux-amd64.tar.gz"

BUNDLE=$(basename "$URL")
FOLDER=${BUNDLE::-7}

# Download and extract build
wget $URL
tar xvf $BUNDLE
rm $BUNDLE

# Move files to bin folder
sudo mkdir -p /usr/local/codeserver/$FOLDER
sudo mv $FOLDER/* /usr/local/codeserver/$FOLDER
rm -r $FOLDER

# Replace assets
cp /usr/local/spread/resources/codeserver/media/* /usr/local/codeserver/$FOLDER/src/browser/media/

# Set up Symlink
sudo ln -sf /usr/local/codeserver/$FOLDER/code-server /usr/local/bin/code-server

# Create startup script
sudo cp /usr/local/spread/resources/codeserver/startup.sh /etc/init.d/codeserver
sudo chmod 755 /etc/init.d/codeserver
sudo update-rc.d codeserver defaults

# Run Code Server
/usr/local/bin/code-server --auth none --port 12000
