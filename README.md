# Installation Script

This script installs and configures various security testing tools on a Linux system.

## Prerequisites
- Ubuntu/Debian-based system 
- Root/sudo access
- Internet connection

## Tools Installed
- Network/Web Testing: mitm6, airgeddon, wifite2
- System Analysis: MANSPIDER, linWinPwn
- Discovery Tools: ProjectDiscovery suite via pdtm
- Authentication Testing: Spray, SeeYouCM-Thief
- Fuzzing: ffuf, fuzzing-templates
- Other: Seth, brutespray

## Usage
```bash
chmod +x install.sh
sudo ./install.sh
```

## Note
- Uses --break-system-packages flag for pip installations
- Modifies ~/.bashrc for PATH and environment variables
- Some tools may require additional configuration
- Review each tool's documentation before use
- For educational and authorized testing only
