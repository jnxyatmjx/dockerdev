FROM centos:7
WORKDIR /
ADD cmake-3.18.1.tar.gz / 
COPY Centos-7-tsinghua.repo /
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repoBAK \
    && mv /Centos-7-tsinghua.repo /etc/yum.repos.d/CentOS-Base.repo \
    && yum makecache && yum update -y \
    && yum install gcc gcc-c++ openssh openssh-server -y && yum clean all \
    && ln -s /cmake-3.18.1-Linux-x86_64/bin/cmake /usr/bin/cmake && /etc/init.d/sshd start \
    && rm -fr /cmake-3.18.1-Linux-x86_64/man /cmake-3.18.1-Linux-x86_64/doc
#WORKDIR /east/dev
#CMD ["/bin/bash"]
