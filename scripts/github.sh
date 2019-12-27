echo "Set up Git user info"

if [ -z "$1" ]
then
  read -p "Email: " EMAIL
else
  EMAIL=$1
fi

if [ -z "$2" ]
then
  read -p "Full Name: " NAME
else
  NAME=$2
fi

git config --global user.email $EMAIL
git config --global user.name $NAME

echo "Set up GitHub access"

# Generate SSH key (for talking to GitHub)
ssh-keygen -t rsa -b 4096 -C $EMAIL -f ~/.ssh/id_rsa -N ""
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

printf "\n\n"
cat ~/.ssh/id_rsa.pub
printf "\n\n"
read -p "Copy the public key and press enter."
xdg-open "https://github.com/settings/keys"
read -p "Once you've added the SSH key, press enter."
ssh -T git@github.com
