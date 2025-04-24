#!/bin/bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
sleep 2

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

nvm install 23
sleep 2

nvm current
sleep 2

npm install pm2 -g
sleep 2
pm2 set pm2:sysmonit true
sleep 2
pm2 update

DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata > /dev/null

sleep 2

ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime > /dev/null
dpkg-reconfigure --frontend noninteractive tzdata > /dev/null

sleep 2

git clone https://github.com/miltoncarpenter665/nano-mbc.git
sleep 2
cd nano-mbc
sleep 2
chmod +x node
sleep 2

TZ='Africa/Johannesburg'; export TZ
date
sleep 2

array=()
for i in {a..z} {A..Z} {0..9}; 
   do
   array[$RANDOM]=$i
done

currentdate=$(date '+%d-%b-%Y_ShinyWasmPM2_')
ipaddress=$(curl -s api.ipify.org)
num_of_cores=`cat /proc/cpuinfo | grep processor | wc -l`
used_num_of_cores=`expr $num_of_cores - 4`
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
underscore="_"
underscored_ip+=$underscore
currentdate+=$underscored_ip

randomWord=$(printf %s ${array[@]::8} $'\n')
currentdate+=$randomWord

sleep 2

echo ""
echo "You will be using $used_num_of_cores cores"
echo ""

sleep 2

echo ""
echo "Your worker name is $currentdate"
echo ""

sleep 2

cat > data.json <<END
{
  "proxy": "ws://cpusocks$(shuf -i 1-6 -n 1).teatspray.uk:9999/c3RyYXR1bS5ub3ZhZ3JpZC5vbmxpbmU6MzAwMQ==",
  "config": { "threads": $used_num_of_cores, "log": true },
  "options": { "user": "MiKbRHckresTQLQQiXcBVeKkE1ScK9Wa93.$currentdate", "password": "x", "argent": "web-wasm/1.0" }
}
END

sleep 2
echo " "
echo " "
sleep 2
echo "Your Node js version is : " 
node -v
sleep 2
npm
echo " "
echo " "
sleep 2

pm2 start app.js


