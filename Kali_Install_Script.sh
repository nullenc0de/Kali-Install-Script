#!/bin/bash
# Update and upgrade the system
apt update
# Install required packages
apt install -y python3-pip parallel unzip wget curl jq libpcap-dev masscan whois git libkrb5-dev
pip3 install gssapi --break-system-packages
# Install Go
apt install golang-go -y
# Configure Go environment variables
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export PATH=/usr/local/go/bin:$PATH' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc
source ~/.bashrc
# Verify Go installation
go version
# Install pipx and MANSPIDER
pip3 install pipx --break-system-packages
pipx install git+https://github.com/blacklanternsecurity/MANSPIDER
# Change to /opt directory
cd /opt
# Clone linWinPwn repository and run its install script
git clone https://github.com/lefayjey/linWinPwn.git
cd linWinPwn
bash install.sh
cd ..
# Install mitm6
pip3 install mitm6 --break-system-packages
# Update existing repositories in /opt
for dir in $(ls); do
  git -C $dir pull
done
# Clone airgeddon repository
git clone --depth 1 https://github.com/v1s1t0r1sh3r3/airgeddon.git
# Clone Seth repository and install its requirements
git clone https://github.com/SySS-Research/Seth.git
cd Seth
pip3 install -r requirements.txt --break-system-packages
cd ..
# Clone SeeYouCM-Thief repository and install its requirements
git clone https://github.com/trustedsec/SeeYouCM-Thief.git
cd SeeYouCM-Thief
pip3 install -r requirements.txt --break-system-packages
cd ..
# Clone wifite2 repository and install it
git clone https://github.com/derv82/wifite2.git
cd wifite2
python3 setup.py install
cd ..
# Clone Spray repository
git clone https://github.com/Greenwolf/Spray.git
# Clone fuzzing-templates repository
git clone https://github.com/projectdiscovery/fuzzing-templates.git
# Install brutespray
apt-get install brutespray -y
# Install Go packages
go install -v github.com/projectdiscovery/pdtm/cmd/pdtm@latest
go install -v github.com/tomnomnom/hacks/kxss@latest
go install -v github.com/Damian89/ffufPostprocessing@latest
go install -v github.com/BishopFox/jsluice/cmd/jsluice@latest
go install -v github.com/ffuf/ffuf/v2@latest
# Create symlink for pdtm
sudo ln -sf $HOME/go/bin/pdtm /usr/local/bin/pdtm
# Install projectdiscovery tools
pdtm -install-all
pdtm -ua
# Ensure all installed binaries are in PATH
echo 'export PATH="${PATH}:/opt/linWinPwn:/opt/Seth:/opt/SeeYouCM-Thief:/opt/wifite2:/opt/Spray:/opt/fuzzing-templates:${HOME}/.local/bin"' >> ~/.bashrc
# Reload shell configuration
source ~/.bashrc
echo "Installation completed. Please open a new terminal or run 'source ~/.bashrc' to apply PATH changes."
