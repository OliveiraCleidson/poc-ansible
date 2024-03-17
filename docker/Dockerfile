FROM ubuntu:20.04

WORKDIR /build

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV TZ=America/Sao_Paulo
ENV DEBIAN_FRONTEND=noninteractive 

# Install all deps for Python and SSH
RUN apt-get update && apt-get install build-essential gdb lcov pkg-config \
      libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev \
      libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev \
      vim ssh sshpass wget \
      lzma lzma-dev tk-dev uuid-dev zlib1g-dev -y

# Install Python
RUN wget https://www.python.org/ftp/python/3.11.8/Python-3.11.8.tgz
RUN tar -xvf Python-3.11.8.tgz

WORKDIR /build/Python-3.11.8
RUN ./configure
RUN make
RUN make install
RUN update-alternatives --install /usr/local/bin/python python /usr/local/bin/python3.11 20
RUN update-alternatives --install /usr/local/bin/python3 python3 /usr/local/bin/python3.11 20

# Install Ansible
WORKDIR /root/ansible
RUN pip3 install ansible

RUN echo 'root:Password123' | chpasswd 
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config
RUN sed -i 's/#PubkeyAuthentication/PubkeyAuthentication/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication/PasswordAuthentication/' /etc/ssh/sshd_config