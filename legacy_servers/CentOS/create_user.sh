# username, user_ID
useradd "$1"
usermod -g builders "$1"
usermod -d /home/"$1" "$1"
passwd "$1"
