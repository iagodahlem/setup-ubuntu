1. Creates a new ssh key, using the provided email as a label
$ -> ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

2. Start the ssh-agent in the background
$ -> eval "$(ssh-agent -s)"

3. Add your SSH key to the ssh-agent
$ -> ssh-add ~/.ssh/id_rsa

4. Copy the SSH key to your clipboard.
$ -> sudo apt-get install xclip
$ -> xclip -sel clip < ~/.ssh/id_rsa.pub

5. Add the SSH Key on Github Account

6. Test Connection
$ -> ssh -T git@github.com

List existing SSH Keys
$ -> ls -al ~/.ssh

