### hw

```bash
sudo apt install lm-sensors
```

### kvm

```bash
sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst
```


## git install

```bash
sudo apt -y remove git
sudo apt -y install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev autoconf asciidoc xmlto docbook2x make gcc
GITVERSION="2.29.3"
wget https://www.kernel.org/pub/software/scm/git/git-$GITVERSION.tar.gz &&
tar -zxf git-$GITVERSION.tar.gz &&
cd git-${GITVERSION} &&
unset GITVERSION &&
./configure --prefix=/usr/local &&
make prefix=/usr/local all &&
make prefix=/usr/local install &&
git --version
```

### vim

```bash
git clone https://github.com/vim/vim
cd vim
sudo apt install -y libncurses5-dev libncursesw5-dev
sudo ./configure --prefix=/usr --enable-rubyinterp --enable-pythoninterp
sudo make
sudo make install
```


### vimrc

```bash
git clone https://github.com/pic0chan/pc_setup.git
cp -f pc_setup/vimrc ~/.vimrc
rm -rf pc_setup
vim
  :PlugInstall
```

### ripgrep

```bash
sudo apt-get install ripgrep -y
```

### docker
ref https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04-ja

```bash
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install -y docker-ce
sudo usermod -aG docker ${USER}
```

### docker-compose
version 確認: https://github.com/docker/compose/releases

```bash
version="1.28.5"
sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
```

