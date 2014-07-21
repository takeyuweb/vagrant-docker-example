FROM centos:centos7
MAINTAINER takeyuweb <info@takeyu-web.com>

RUN yum update -y

# SSH Setup
EXPOSE 22
RUN touch /etc/rc.d/init.d/functions
RUN yum install -y openssh openssh-server openssh-clients
RUN /usr/bin/ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key  -C '' -N ''
RUN /usr/bin/ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key  -C '' -N ''

# User Setup
RUN yum install -y passwd sudo curl
RUN useradd docker
RUN echo 'docker' | passwd --stdin docker
RUN echo 'docker    ALL=(ALL)       ALL' >> /etc/sudoers.d/docker
RUN mkdir /home/docker/.ssh
ADD docker/insecure_key.pub /home/docker/.ssh/authorized_keys
RUN chown -R docker:docker /home/docker/.ssh
RUN chmod 700 /home/docker/.ssh
RUN chmod 644 /home/docker/.ssh/authorized_keys

# Nginx Setup
EXPOSE 80
ADD docker/nginx.repo /etc/yum.repos.d/
RUN yum --enablerepo=nginx install -y nginx
ADD index.html /usr/share/nginx/html/
RUN chmod 644 /usr/share/nginx/html/index.html

# START
ADD docker/bootstrap.sh /bootstrap.sh
RUN chmod 700 /bootstrap.sh
ENTRYPOINT ["/bootstrap.sh"]
