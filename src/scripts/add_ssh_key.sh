SSH=~/.ssh
KEY=$SSH/id_rsa
mkdir -p $SSH
chmod 700 $SSH
echo -e
"$MY_CODE_SSH_KEY" >$KEY
chmod 400 $KEY

ssh-keygen -y -f ~/.ssh/id_rsa >~/.ssh/id_rsa.pub

echo -e "Host github.com\n\tHostname github.com\n\tIdentityFile
        ~/.ssh/id_rsa\n\tIdentitiesOnly yes" >$SSH/config
