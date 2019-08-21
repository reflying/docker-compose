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

# 安装docker-compose
pip install  docker-compose

# 创建数据库目录
mkdir /data/mysql/logs -p
mkdir /data/kafka

# 加权限
chmod +x kafka-sasl/conf/kafka-server-start

