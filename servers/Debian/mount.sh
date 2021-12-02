images=(
        # img mount_point
        'ccache.ext4 /home/ccache'
        'sarthak.ext4 /home/sarthak sarthak'
        'aditya.ext4 /home/aditya aditya'
        'mihir.ext4 /home/mihir mihir'
        'nitin.ext4 /home/nitin nitin'
        'calin.ext4 /home/calin calin'
        'akhil.ext4 /home/akhil akhil'
        'zeeshan.ext4 /home/zeeshan zeeshan'
        'shreesha.ext4 /home/shreesha shreesha'
        'shubham.ext4 /home/shubham shubham'
        'anthony.ext4 /home/anthony anthony'
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

echo "performance" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
service apache2 start
service jenkins start
