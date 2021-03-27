### epel
```bash
sudo yum install epel-release -y
```

### git 最新
```bash
sudo yum install gcc curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker
GITVERSION="2.16.2" &&
wget https://www.kernel.org/pub/software/scm/git/git-$GITVERSION.tar.gz &&
tar -zxf git-$GITVERSION.tar.gz &&
cd git-$GITVERSION &&
unset GITVERSION &&
make prefix=/usr/local all &&
make prefix=/usr/local install &&
git --version
```

ref http://goodbyegangster.hatenablog.com/entry/2016/12/30/142454 これも記入する

### vim
ref vim build (ref: http://goodbyegangster.hatenablog.com/entry/2016/12/30/142454 )
ref ./configure でエラーになったら > sudo yum install ncurses-devel
```bash
git clone
git clone https://github.com/vim/vim
cd vim
sudo yum -y install lua-devel perl-ExtUtils-Embed ruby-devel
sudo ./configure --prefix=/usr --enable-rubyinterp --enable-pythoninterp
sudo make
sudo make install
```

### PATH
```bash
echo "PATH=\$PATH:/usr/local/bin/" >> ~root/.bashrc
```

### vim plugin
```bash
git clone https://github.com/pic0chan/pc_setup.git
cp -f pc_setup/vimrc ~/.vimrc
rm -rf pc_setup
vim
  :PlugInstall
```

### silver searcher のインストール
```bash
sudo yum install the_silver_searcher
```

### rbenv
```bash
sudo yum install -y readline-devel bzip2
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
rbenv --version
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install --list
rbenv install -v 2.0.0-p353
rbenv rehash
rbenv versions
rbenv global 2.0.0-p353
ruby -v
```

### rbenv-gemset
```bash
cd ~/.rbenv/plugins/
git clone https://github.com/jf/rbenv-gemset.git
rbenv-gemset create 2.x.x hoge
echo "hoge" > .rbenv-gemsets
```

### rbenv-update
```bash
cd ~/.rbenv/plugins/
git clone https://github.com/rkh/rbenv-update.git
rbenv update
```

### pyenv setup
```bash
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
echo 'export PYENV_ROOT=~/.pyenv' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
```

### docker
ref https://qiita.com/okcoder/items/e91f1e339c114e0be129
```bash
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce -y
docker -v
sudo systemctl start docker
sudo systemctl enable docker
```

### kubectl用
ref https://kubernetes.io/docs/reference/generated/kubectl/kubectl/
```bash
sudo yum install bash-completion
echo "source <(kubectl completion bash)" >> ~/.bashrc
```

### docker-compose
ref version 確認: https://github.com/docker/compose/releases
```bash
version="1.21.0"
sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
```

### protoc
```bash
sudo yum install protobuf protobuf-compiler
```

### rg
ref https://github.com/BurntSushi/ripgrep
```bash
sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
sudo yum install ripgrep
```

### tmux
```bash
yum install -y automake byacc libevent-devel
git clone https://github.com/tmux/tmux
cd tmux
./autogen.sh
./configure --prefix=/usr/local
make && sudo make install
```
