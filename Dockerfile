FROM ubuntu:16.04

MAINTAINER turtle "18230373213@163.com"

RUN  apt-get update && \
        debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password password root'  && \
        debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password_again password root'  && \
        apt-get install -y mysql-server-5.7 mysql-common && \
        apt-get install -y php && \
        apt-get install -y nginx && \
        apt-get install -y vim



# 配置nginx

Copy ./default /etc/nginx/sites-available/default

# 添加启动脚本
ADD ./start.sh /start.sh
RUN chmod 755 /start.sh


CMD /start.sh && tail -f

# Expose ports.
EXPOSE 3306
EXPOSE 80
