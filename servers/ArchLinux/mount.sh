images=(
        # img mount_point
	'deepak.ext4 /home/deepak deepak'
	'vatsal.ext4 /home/vatsal vatsal'
        'sud.ext4 /home/sud sud'
        'fenix.ext4 /home/fenix fenix'
        'legacy.ext4 /home/legacy legacy'
        'vivek.ext4 /home/vivek vivek'
        'saatvik.ext4 /home/saatvik saatvik'
        'soham.ext4 /home/soham soham'
        'shivam.ext4 /home/shivam shivam'
        'sanyam.ext4 /home/sanyam sanyam'
	'ccache.ext4 /home/ccache'
	'common.ext4 /home/common common'
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

usermod -a -G builders jenkins
chown jenkins:builders /home/ccache
systemctl restart httpd
systemctl restart jenkins
cpupower frequency-set -g performance
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
cd /home/gerrit2
./bin/gerrit.sh start
exit
cd
