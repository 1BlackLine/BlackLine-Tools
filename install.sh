#!/bin/bash

# install zsh
sudo apt install zsh -y
chsh -s $(which zsh)

# Update dan upgrade sistem
sudo apt update && sudo apt upgrade -y

# Instalasi alat-alat yang diperlukan
sudo apt install -y python3 python3-pip git

# Instalasi sqlmap
sudo apt install sqlmap

# Instalasi gau
echo "Installing gau..."
GO111MODULE=on go install github.com/lc/gau/v2/cmd/gau@latest
sudo ln -s $(go env GOPATH)/bin/gau /usr/local/bin/gau

# Instalasi waybackurls
echo "Installing waybackurls..."
go install github.com/tomnomnom/waybackurls@latest
sudo ln -s $(go env GOPATH)/bin/waybackurls /usr/local/bin/waybackurls

# Instalasi dirsearch
echo "Installing dirsearch..."
git clone https://github.com/maurosoria/dirsearch.git
sudo ln -s $(pwd)/dirsearch/dirsearch.py /usr/local/bin/dirsearch

# Instalasi nuclei
echo "Installing nuclei..."
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
sudo ln -s $(go env GOPATH)/bin/nuclei /usr/local/bin/nuclei

# Instalasi subfinder
echo "Installing subfinder..."
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
sudo ln -s $(go env GOPATH)/bin/subfinder /usr/local/bin/subfinder

# Instalasi httpx
echo "Installing httpx..."
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
sudo ln -s $(go env GOPATH)/bin/httpx /usr/local/bin/httpx

# Instalasi gf dan gf patterns dari 1ndianl33t
echo "Installing gf and gf patterns..."
go install github.com/tomnomnom/gf@latest
sudo ln -s $(go env GOPATH)/bin/gf /usr/local/bin/gf
git clone https://github.com/1ndianl33t/Gf-Patterns
mkdir ~/.gf
mv Gf-Patterns/*.json ~/.gf

# Instalasi uro
echo "Installing uro..."
pip3 install uro

# Instalasi qsreplace
echo "Installing qsreplace..."
go install github.com/tomnomnom/qsreplace@latest
sudo ln -s $(go env GOPATH)/bin/qsreplace /usr/local/bin/qsreplace

# Instalasi freq
echo "Installing freq..."
go install github.com/takshal/freq@latest
sudo ln -s $(go env GOPATH)/bin/freq /usr/local/bin/freq

# Instalasi urldedupe
echo "Installing urldedupe..."
go install github.com/lc/urldedupe@latest
sudo ln -s $(go env GOPATH)/bin/urldedupe /usr/local/bin/urldedupe

# Bersihkan cache
sudo apt autoremove -y

echo "Installation completed!"
