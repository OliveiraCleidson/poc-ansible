FROM ubuntu:18.04
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

WORKDIR /build

# install python pip
RUN apt-get update && apt-get install curl vim ssh sshpass python3.8 python3-pip -y
RUN pip3 install --upgrade pip
RUN pip3 install ansible

WORKDIR /root
RUN echo 'root:Password123' | chpasswd 
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config
RUN sed -i 's/#PubkeyAuthentication/PubkeyAuthentication/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication/PasswordAuthentication/' /etc/ssh/sshd_config