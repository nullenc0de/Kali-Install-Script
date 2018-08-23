#!/bin/bash

#Note, this is a script that I started to build after repeatedly needing to roll out builds. 
#I thought about creating a custom Kali Distro, however with needing to install custom tools from github 
#I decided on a modifiable script instead. When I started to build the script, 
#I built upon the foundation that Matthew Clark May had used in a Repository he created, but no longer maintains. Credit where it's due.

apt-get update ; apt-get -y upgrade ; apt-get -y dist-upgrade ; apt-get -y autoremove ; apt-get -y autoclean ; echo
sudo apt-get install git -y
sudo apt-get install python3 -y
sudo apt-get install screen -y
sudo apt-get install fimap -y
sudo apt-get install sshpass -y
sudo apt-get install commix -y
sudo apt-get install sqlmap -y
sudo apt-get install python3 -y
pip install ldapdomaindump

echo "-------------------------------------------------------------------"
echo "----- Updated Github Tools, Next Phase ------"
echo "-------------------------------------------------------------------"

echo "-------------------------------------------------------------------"
echo "----- Update, Upgrade, and Dist-Upgrade Complete, Next Phase ------"
echo "-------------------------------------------------------------------"

sudo apt-get install htop hexedit exiftool exif -y 

echo "-------------------------------------------------------------------"
echo "---------- Basic Tools Installed, Next Phase ------------"
echo "-------------------------------------------------------------------"

sudo service postgresql start
msfdb init

echo "-------------------------------------------------------------------"
echo "--------------- Metasploit configured, Next Phase -----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/x90skysn3k/brutespray.git
cd brutespray/
sudo pip install -r requirements.txt
cd /opt

echo "-------------------------------------------------------------------"
echo "--------------- Brutespray Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/ztgrace/changeme.git
cd changeme/
sudo apt-get install unixodc-dev -y
sudo pip install -r requirements.txt
cd /opt

echo "-------------------------------------------------------------------"
echo "--------------- Changeme Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/FortyNorthSecurity/EyeWitness.git
cd EyeWitness/
cd setup/
sudo ./setup.sh -y
cd /opt

echo "-------------------------------------------------------------------"
echo "--------------- EyeWitness Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/danielmiessler/SecLists.git

echo "-------------------------------------------------------------------"
echo "--------------- SecLists Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/leebaird/discover.git
cd discover/
sudo ./update.sh
cd /opt

echo "-------------------------------------------------------------------"
echo "--------------- Discover Installed, It installed Lots!! Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/1N3/Sn1per.git
cd Sn1per/
echo "Follow Prompts!!"
sudo ./install.sh
cd /opt

echo "-------------------------------------------------------------------"
echo "--------------- Sn1per Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/maaaaz/impacket.git && cd impacket
pip install .
cd /opt

sudo git clone https://github.com/jhaddix/domain.git

echo "-------------------------------------------------------------------"
echo "--------------- Domain Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/cakinney/domained.git
cd domained/
sudo python domained.py --install
cd /opt

echo "-------------------------------------------------------------------"
echo "--------------- Domained Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/elceef/dnstwist.git
sudo apt-get install python-dnspython python-geoip python-whois python-requests python-ssdeep python-cffi -y
cd /opt


echo "-------------------------------------------------------------------"
echo "--------------- DnsTwist Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/vulnersCom/nmap-vulners.git

echo "-------------------------------------------------------------------"
echo "--------------- nmap-vulners Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/si9int/cc.py.git

echo "-------------------------------------------------------------------"
echo "--------------- cc.py Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/abhaybhargav/bucketeer.git

echo "-------------------------------------------------------------------"
echo "--------------- Bucketeer Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/DanMcInerney/icebreaker.git

echo "-------------------------------------------------------------------"
echo "--------------- Icebreaker Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://bitbucket.org/grimhacker/office365userenum.git

echo "-------------------------------------------------------------------"
echo "------------- O365 Pass Spray Tool Installed, Next Tool! ----------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/mdsecactivebreach/LinkedInt.git
sudo pip install beautifulsoup4
sudo pip install thready
cd /opt

echo "-------------------------------------------------------------------"
echo "--------------- LinkedInt Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

git clone https://github.com/ZerBea/hcxdumptool.git
cd hcxdumptool
make install
cd /opt

echo "-------------------------------------------------------------------"
echo "--------------- hcxdumptool Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

git clone https://github.com/ZerBea/hcxtools.git
cd hcxtools
apt-get install libcurl4-openssl-dev libssl-dev zlib1g-dev libpcap-dev -y
make install
cd /opt

echo "-------------------------------------------------------------------"
echo "--------------- hcxtools Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo apt-get install -y libssl-dev libffi-dev python-dev build-essential
pip install --user pipenv
sudo git clone --recursive https://github.com/byt3bl33d3r/CrackMapExec
cd CrackMapExec && pipenv install
pipenv shell
python setup.py install
cd /opt

echo "-------------------------------------------------------------------"
echo "--------------- Crackmapexec Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/si9int/cc.py.git

echo "-------------------------------------------------------------------"
echo "--------------- cc.py Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/sqlmapproject/sqlmap.git

echo "-------------------------------------------------------------------"
echo "--------------- Sqlmap Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/derv82/wifite2.git
cd wifite2
sudo python setup.py install
cd /opt

echo "-------------------------------------------------------------------"
echo "--------------- Wifite2 Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/epinna/tplmap.git
cd tplmap
pip install -r requirements.txt
cd /opt

echo "-------------------------------------------------------------------"
echo "--------------- tplmap Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

cd /opt
ls | xargs -I{} git -C {} pull

echo "-------------------------------------------------------------------"
echo "--------------- All Tools Installed/Updated! Go Break Some Stuff! ---------"
echo "-------------------------------------------------------------------"
