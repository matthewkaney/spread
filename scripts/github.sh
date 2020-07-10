#Clone GitHub repositories and set up GitHub SSH if necessary

if [ -z $(git config user.email) ]
then
  read -p "Email: " EMAIL
  git config --global user.email $EMAIL
else
  EMAIL=$(git config user.email)
fi

if [ -z $(git config user.name) ]
then
  read -p "Full Name: " NAME
  git config --global user.name $NAME
else
  NAME=$(git config user.name)
fi

if [ -f /usr/local/github-username ]
then
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
  # TODO: Save username in a file
fi

if [ ! -z $2 ]
then
  # TODO: Allow user to clone repos
fi
