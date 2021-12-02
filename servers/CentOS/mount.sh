images=(
        # img mount_point
        'ccache.ext4 /home/ccache'
        'vatsal.ext4 /home/vatsal vatsal'
        'deepak.ext4 /home/deepak deepak'
        'sud.ext4 /home/sud sud'
        'fenix.ext4 /home/fenix fenix'
        'legacy.ext4 /home/legacy legacy'
        'vivek.ext4 /home/vivek vivek'
        'saatvik.ext4 /home/saatvik saatvik'
        'soham.ext4 /home/soham soham'
        'shivam.ext4 /home/shivam shivam'
        'common.ext4 /home/common common'
        'sanyam.ext4 /home/sanyam sanyam'
	'rohan.ext4 /home/rohan rohan'
)


count=0

while [ "x${images[count]}" != "x" ]; do
        curr="${images[count]}"
        image=`echo "$curr" | awk '{print $1}'`
        mount=`echo "$curr" | awk '{print $2}'`
        user=`echo "$curr" | awk '{print $3}'`

        if [ ! "$1" == "umount" ]; then
                mount -t ext4 -o loop /home/images/$image $mount
                chown "$user":builders $mount
        else
                umount $mount
        fi

        count=$(( $count + 1 ))
done

chown jenkins:builders /home/ccache
sudo usermod -a -G builders jenkins
