#!/bin/bash

#Note, this is a script that I started to build after repeatedly needing to roll out builds. 
#I thought about creating a custom Kali Distro, however with needing to install custom tools from github 
#I decided on a modifiable script instead. When I started to build the script, 
#I built upon the foundation that Matthew Clark May had used in a Repository he created, but no longer maintains. Credit where it's due.

#!/bin/bash

# Update and upgrade the system
apt update && apt upgrade -y

# Install required packages
apt install -y python3-pip parallel unzip wget curl jq libpcap-dev golang-go masscan whois git

# Install pipx and MANSPIDER
pip install pipx
pipx install git+https://github.com/blacklanternsecurity/MANSPIDER

# Clone linWinPwn repository and run its install script
git clone https://github.com/lefayjey/linWinPwn.git
cd linWinPwn
bash install.sh

# Install mitm6
pip3 install mitm6

# Update existing repositories in /opt
cd /opt
for dir in $(ls); do
  git -C $dir pull
done

# Clone airgeddon repository
git clone --depth 1 https://github.com/v1s1t0r1sh3r3/airgeddon.git

# Clone Seth repository and install its requirements
git clone https://github.com/SySS-Research/Seth.git
cd Seth
pip3 install -r requirements.txt

# Clone SeeYouCM-Thief repository and install its requirements
cd /opt
sudo git clone https://github.com/trustedsec/SeeYouCM-Thief.git
cd SeeYouCM-Thief
python3 -m pip install -r requirements.txt

# Clone wifite2 repository and install it
sudo git clone https://github.com/derv82/wifite2.git
cd wifite2
sudo python setup.py install

# Clone Spray repository
cd /opt
git clone https://github.com/Greenwolf/Spray.git

# Clone fuzzing-templates repository
git clone https://github.com/projectdiscovery/fuzzing-templates.git

# Install brutespray
apt-get install brutespray -y

# Configure Go environment variables
GOROOT="/usr/local/go"
PATH="${PATH}:${GOROOT}/bin"
GOPATH=$HOME/go
PATH="${PATH}:${GOROOT}/bin:${GOPATH}/bin"

# Install Go packages
go install -v github.com/projectdiscovery/pdtm/cmd/pdtm@latest
go install -v github.com/tomnomnom/hacks/kxss@latest
go install -v github.com/Damian89/ffufPostprocessing@latest
go install -v github.com/BishopFox/jsluice/cmd/jsluice@latest
go install -v github.com/ffuf/ffuf/v2@latest
