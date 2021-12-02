# username, user_ID
useradd "$1"
usermod -g build-users "$1"
usermod -d /home/jenkins/vfs/"$2" "$1"
passwd "$1"
