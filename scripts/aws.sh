#Install Amazon Web Services command line interface

curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q ./awscliv2.zip
sudo ./aws/install --update

rm ./awscliv2.zip
rm -rf ./aws