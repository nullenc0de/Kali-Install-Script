wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add
apt-get update
apt-get install -y dirmngr

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ED444FF07D8D0BF6

mv /etc/apt/sources.list /etc/apt/sources.list.debian
cat <<EOF > /etc/apt/sources.list
deb http://http.kali.org/kali kali-rolling main non-free contrib
deb-src http://http.kali.org/kali kali-rolling main non-free contrib
EOF

apt-get update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoremove --purge
apt-get -y install kali-linux

apt-get -y autoremove --purge
apt-get clean
echo Done.
