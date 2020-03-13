# install go language
wget https://dl.google.com/go/go1.12.6.linux-amd64.tar.gz
tar -C /usr/local -zxvf go1.12.6.linux-amd64.tar.gz

cat>>/etc/profile<<EOF
export GOROOT=/usr/local/go
export PATH=\$PATH:\$GOROOT/bin
EOF

. /etc/profile

# replace the apt source with aliyun source
mv /etc/apt/sources.list /etc/apt/sources.list.bak 

cat > /etc/apt/sources.list << EOF 
deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse 
deb http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse 
deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse 
deb http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse 
deb http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse 
deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse 
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse 
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse 
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse 
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse 
EOF

apt-get update
apt -y upgrade

# install git and dependence(liberror-perl)
apt -y install liberror-perl
apt -y install git

# install mydocker
mkdir /usr/local/go/src/github.com
mkdir /usr/local/go/src/github.com/xianlubird
mkdir /usr/local/go/src/github.com/xianlubird/mydocker
git clone https://github.com/xianlubird/mydocker.git /usr/local/go/src/github.com/xianlubird/mydocker
mv /usr/local/go/src/github.com /usr/local/go/src/github
cp -r /usr/local/go/src/github/xianlubird/mydocker/vendor/golang.org /usr/local/go/src/
cp -r /usr/local/go/src/github/xianlubird/mydocker/vendor/github.com /usr/local/go/src/
mv /usr/local/go/src/github/xianlubird /usr/local/go/src/github.com/
rm -rf /usr/local/go/src/github

#install docker by apt
apt install docker.io
# install himma
git clone https://github.com/abitfaith/himma.git
