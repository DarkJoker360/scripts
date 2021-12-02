# username, user_ID
useradd -m -d /home/"$1" -s /bin/bash "$1"
usermod -g builders "$1"
passwd "$1"
