echo "Install VS Code Server"

# Delete build of Code Server
sudo rm -rf /usr/local/codeserver

# Get Name of Latest Code Server Build
URL=$(curl -s https://api.github.com/repos/cdr/code-server/releases/latest \
| grep "browser_download_url" \
| grep "linux-x86_64" \
| cut -d : -f 2,3 \
| tr -d \" )

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

# Make code-server executable
sudo chmod +x /usr/local/codeserver/code-server

# Set up Symlink
sudo ln -s /usr/local/codeserver/code-server /usr/local/bin/code-server

# Create startup script
sudo cp ~/scripts/codeserver/deps/startup.sh /etc/init.d/codeserver
sudo chmod 755 /etc/init.d/codeserver
sudo update-rc.d codeserver defaults