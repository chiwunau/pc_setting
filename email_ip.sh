#/bin/sh
IPADDRESS=$(/sbin/ifconfig eth0 | sed -n 's/.*inetアドレス:\([^ ]*\).*/\1/p')
if [[ "${IPADDRESS}" != $(cat ~/.current_ip) ]]
then
sendEmail -o tls=yes -f from@gmail.com -t to@gmail.com -s smtp.gmail.com:25 -xu from@gmail.com -xp PASSWORD -u "leus IP adress changed" -m "New IP: ${IPADDRESS}"
echo ${IPADDRESS} >|~/.current_ip
fi