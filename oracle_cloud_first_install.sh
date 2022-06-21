### FIRST STEP ###

# CHANGE DEFAULT USER (UBUNTU) PASSWORD
sudo passwd ubuntu

# GENERATE A ROOT PASSWORD
sudo -i
apt install sudo
passwd

# ADD USER
adduser atilla
sudo adduser atilla sudo
su atilla


### REPOSITORIES ####

## AUTOMATICLY INSTALL RECOMMENDED PACKAGES
sudo nano /etc/apt/apt.conf

# ADD THESE LINES
APT::Get::Install-Recommends "true";
APT::Get::Install-Suggests "false";


## ADD ALL REPOS TO THE SOURCES.LIST FILE
sudo nano /etc/apt/sources.list

# ADD THESE LINES
deb http://eu-frankfurt-1-ad-3.clouds.ports.ubuntu.com/ubuntu-ports/ focal main restricted
deb-src http://eu-frankfurt-1-ad-3.clouds.ports.ubuntu.com/ubuntu-ports/ focal main restricted

deb http://eu-frankfurt-1-ad-3.clouds.ports.ubuntu.com/ubuntu-ports/ focal-updates main restricted
deb-src http://eu-frankfurt-1-ad-3.clouds.ports.ubuntu.com/ubuntu-ports/ focal-updates main restricted

deb http://eu-frankfurt-1-ad-3.clouds.ports.ubuntu.com/ubuntu-ports/ focal universe
deb-src http://eu-frankfurt-1-ad-3.clouds.ports.ubuntu.com/ubuntu-ports/ focal universe
deb http://eu-frankfurt-1-ad-3.clouds.ports.ubuntu.com/ubuntu-ports/ focal-updates universe
deb-src http://eu-frankfurt-1-ad-3.clouds.ports.ubuntu.com/ubuntu-ports/ focal-updates universe

deb http://eu-frankfurt-1-ad-3.clouds.ports.ubuntu.com/ubuntu-ports/ focal multiverse
deb-src http://eu-frankfurt-1-ad-3.clouds.ports.ubuntu.com/ubuntu-ports/ focal multiverse
deb http://eu-frankfurt-1-ad-3.clouds.ports.ubuntu.com/ubuntu-ports/ focal-updates multiverse
deb-src http://eu-frankfurt-1-ad-3.clouds.ports.ubuntu.com/ubuntu-ports/ focal-updates multiverse

deb http://eu-frankfurt-1-ad-3.clouds.ports.ubuntu.com/ubuntu-ports/ focal-backports main restricted universe multiverse
deb-src http://eu-frankfurt-1-ad-3.clouds.ports.ubuntu.com/ubuntu-ports/ focal-backports main restricted universe multiverse

deb http://archive.canonical.com/ubuntu focal partner
deb-src http://archive.canonical.com/ubuntu focal partner

deb http://ports.ubuntu.com/ubuntu-ports focal-security main restricted
deb-src http://ports.ubuntu.com/ubuntu-ports focal-security main restricted
deb http://ports.ubuntu.com/ubuntu-ports focal-security universe
deb-src http://ports.ubuntu.com/ubuntu-ports focal-security universe
deb http://ports.ubuntu.com/ubuntu-ports focal-security multiverse
deb-src http://ports.ubuntu.com/ubuntu-ports focal-security multiverse

# CHECH AVAILABLE REPOSITORIES
sudo egrep -h -v '(^#)|(^$)' /etc/apt/sources.list $(ls /etc/apt/sources.list.d/*.list 2> /dev/null)


### UPDATE ###
sudo apt update -y
sudo apt dist-upgrade -y
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt autoremove -y


### INSTALL DEVELOPMENT DEPENDENCIES ###
sudo apt install -y git apt-transport-https build-essential procps curl file git libz-dev \
    libssl-dev libexpat1-dev gettext cmake gcc openssh-server \
    software-properties-common build-essential zlib1g-dev libncurses5-dev libgdbm-dev \
    libnss3-dev libssl-dev libreadline-dev libffi-dev wget build-essential libssl-dev \
    libffi-dev python3-dev apt-transport-https ca-certificates curl software-properties-common \
    nano git apt-transport-https ca-certificates gnupg2 software-properties-common \
    gnupg-agent dirmngr git-core zlib1g-dev build-essential libssl-dev libdb-dev \
    libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev xvfb \
    software-properties-common libffi-dev ca-certificates gnupg libcurl4 \
    lsb-release manpages-dev git gnupg flex bison gperf build-essential zip libc6-dev \
    libncurses5-dev x11proto-core-dev libx11-dev libreadline6-dev libgl1-mesa-glx \
    libgl1-mesa-dev tofrodos python3-markdown libxml2-utils xsltproc zlib1g-dev \
    build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev \
    libreadline-dev libffi-dev libbz2-dev unzip  libxi6 libgconf-2-4 \
    build-essential libssl-dev libffi-dev build-essential procps file git \
    openssh-server g++ gcc autoconf automake bison libc6-dev libffi-dev libgdbm-dev \
    libncurses5-dev libsqlite3-dev libtool libyaml-dev make pkg-config sqlite3 zlib1g-dev \
    libgmp-dev libreadline-dev libssl-dev git autoconf bison build-essential libssl-dev \
    libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev


### NETWORK DEPENDENCIES ###
sudo apt install -y net-tools iproute2


### CONFIGURATION DEPENDENCIES ###
sudo apt install -y gparted sysbench p7zip-full


### CONFIGURE SYSTEM ###
## ADD PATH
nano ~/.bashrc
export PATH="/home/atilla/.local/bin:$PATH" # ADD THIS LINE TO THE END OF THE FILE
source ~/.bashrc

## Disabling Swap Memory
sudo swapoff -a

# comment out the swapfile line
sudo nano /etc/fstab


### ADDING ADDITIONAL REPOS ###
sudo -i

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
sudo echo "deb [arch=amd64]  http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list

add-apt-repository --yes --update ppa:ansible/ansible

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" >> ~/kubernetes.list
sudo mv ~/kubernetes.list /etc/apt/sources.list.d

curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list


### UPDATE ###
sudo apt update -y
sudo apt dist-upgrade -y
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt autoremove -y


### SETTING UP PACKAGE MANAGERS ###
su atilla

## TASKSEL
sudo apt install -y tasksel

## SNAP
sudo apt install -y snapd

## BREW
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >> ~/.bash_profile
#source .bash_profile

## APTITUDE
sudo apt install -y aptitude
aptitude --version

## FLATPACK
sudo apt install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


### UPDATES FOR ALL PACKAGE MANAGERS ###
sudo aptitude update
sudo aptitude safe-upgrade
sudo aptitude full-upgrade

sudo snap refresh

sudo flatpak update

#sudo brew update
#sudo brew upgrade


### SOFTWARE DEVELOPMENT ###

## VIM
sudo apt install -y vim

## UMAKE
sudo apt install -y ubuntu-make

## PYTHON
sudo apt remove python3-jinja2

sudo apt install -y python3-pip python3-dev python3-venv
pip3 install numpy
pip3 install matplotlib
pip3 install Jinja2
pip3 install notebook

## JAVA
sudo apt install -y default-jre
java -version
sudo apt install -y default-jdk
javac -version

## RUBY
sudo apt install -y ruby-full
ruby -v

## PERL
sudo apt-get install perl
sudo apt install libnet-ssleay-perl libio-socket-ssl-perl
sudo apt install libpath-tiny-perl

## YARN
sudo apt install yarn

## NODEJS
sudo apt install nodejs
sudo apt install npm

## GOLANG
sudo apt install gccgo-go
sudo apt install golang-go


### DEVOPS ###

## ANSIBLE
sudo apt install -y ansible
ansible --version

## DOCKER
sudo apt remove -y docker docker-engine docker.io containerd runc
sudo apt install -y --install-suggests docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo usermod -aG docker $USER

sudo systemctl enable docker.service
sudo systemctl start docker.service

sudo docker ps

## KUBERNETES
sudo apt install -y --install-suggests kubelet kubeadm kubectl kubernetes-cni
sudo apt-mark hold kubelet kubeadm kubectl kubernetes-cni

sudo rm /etc/containerd/config.toml
sudo systemctl restart containerd

TOKEN=$(sudo kubeadm token generate)
echo $TOKEN
sudo kubeadm init --token=${TOKEN} --pod-network-cidr=10.244.0.0/16


mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/k8s-manifests/kube-flannel-rbac.yml


## HETZNER MANAGER
#sudo brew install hcloud

## HELM
sudo apt install -y helm


### INSTALL APPS ###

## SNAP APPS
sudo snap install core
snap refresh core
sudo snap install hello-world
hello-world

## BREW APPS
#sudo brew doctor
#sudo brew install hello

## DOCKER APPS
sudo docker run hello-world

## APT APPS
sudo apt install -y rsync
sudo apt install -y certbot
sudo apt install -y tmux


### UPDATING KERNEL ###

## KERNEL UPDATE UTILITY
uname -r
sudo wget https://raw.githubusercontent.com/pimlie/ubuntu-mainline-kernel.sh/master/ubuntu-mainline-kernel.sh
sudo install ubuntu-mainline-kernel.sh /usr/local/bin/

## UPDATE GRUB
sudo update-grub


### INSTALL FILESYSTEM ZFS, EXFAT, NTFS, HFS
sudo apt install -y zfsutils-linux
sudo apt install -y exfat-fuse exfat-utils
sudo apt install -y fuse
sudo apt install -y ntfs-3g
sudo apt install -y hfsprogs
sudo apt install -y samba

# Check storage
df


### GOOGLE CHROME
sudo apt install google-chrome-stable


#Automated security updates
sudo apt install -y --install-suggests unattended-upgrades
sudo systemctl enable unattended-upgrades
sudo systemctl start unattended-upgrades


### CONFIGURE 

# TWO FACTOR AUTHENTICATOR
sudo apt install libpam-google-authenticator

# FAIL2BAN
apt install fail2ban



