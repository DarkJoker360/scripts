images=(
        # img mount_point
        'ccache.ext4 /home/jenkins/vfs/drive_ccache'
        'user_1.ext4 /home/jenkins/vfs/user_1 vatsal'
        'user_2.ext4 /home/jenkins/vfs/user_2 deepak'
        'user_3.ext4 /home/jenkins/vfs/user_3 sud'
        'user_4.ext4 /home/jenkins/vfs/user_4 fenix'
        'user_5.ext4 /home/jenkins/vfs/user_5 legacy'
        'user_6.ext4 /home/jenkins/vfs/user_6 vivek'
        'user_7.ext4 /home/jenkins/vfs/user_7 saatvik'
        'user_8.ext4 /home/jenkins/vfs/user_8 soham'
        'user_9.ext4 /home/jenkins/vfs/user_9 shivam'
        'user_common.ext4 /home/jenkins/vfs/user_common common'
        'gerrit2.ext4 /home/gerrit2'
        'user_10.ext4 /home/jenkins/vfs/user_10 sanyam'
)


count=0

while [ "x${images[count]}" != "x" ]; do
        curr="${images[count]}"
        image=`echo "$curr" | awk '{print $1}'`
        mount=`echo "$curr" | awk '{print $2}'`
        user=`echo "$curr" | awk '{print $3}'`

        if [ ! "$1" == "umount" ]; then
                mount -t ext4 -o loop /home/jenkins/vfs/images/$image $mount
                chown "$user":build-users $mount
        else
                umount $mount
        fi

        count=$(( $count + 1 ))
done

chown jenkins:build-users /home/jenkins/vfs/drive_ccache
sudo usermod -a -G build-users jenkins
