#

# 环境:centos7
# docker 安装
sudo  yum install -y yum-utils device-mapper-persistent-data lvm2 git
sudo  yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
sudo  yum makecache fast
sudo  yum -y install docker-ce

# 添加阿里云镜像加速
sudo mkdir -p /etc/docker

sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://1jqsv485.mirror.aliyuncs.com"]
}
EOF

sudo systemctl daemon-reload
sudo systemctl restart docker
sudo systemctl enable docker.service

# 创建数据目录
mkdir /data/mysql/logs -p
mkdir /data/kafka -p
mkdir /data/zookeeper -p
mkdir /data/rabbitmq  -p

#python3
yum -y install "Development tools"
yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel t k-devel gdbm-devel db4-devel libpcap-devel xz-devel libffi-devel
wget http://npm.taobao.org/mirrors/python/3.8.0/Python-3.8.0rc1.tar.xz
mkdir /usr/local/python3
tar -xvJf Python-3.8.0rc1.tar.xz
cd Python-3.8.0rc1
./configure --prefix=/usr/local/python3
make && make install
ln -s /usr/local/python3/bin/python3 /usr/bin/python3
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3

# 安装docker-compose
pip3 install  docker-compose  -i https://pypi.douban.com/simple/ 
ln -s /usr/local/python3/bin/docker-compose /usr/bin/docker-compose



