FROM ubuntu:20.04

WORKDIR /yocto

RUN apt-get update  
#Установка локали 
RUN apt-get -y install locales && locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

ENV DEBIAN_FRONTEND=noninteractive
# Установка зависимостей для сборки Yocto
RUN apt-get update && apt-get -y install gawk wget git diffstat \ 
    unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip \ 
    python3-pexpect xz-utils debianutils iputils-ping python3-git \ 
    python3-jinja2 libegl1-mesa libsdl1.2-dev \ 
    pylint3 xterm python3-subunit mesa-common-dev zstd liblz4-tool

RUN rm /bin/sh && ln -s bash /bin/sh
#Создание пользователя, сборка от root запрещена
ENV USER_NAME head
ARG host_uid=1001
ARG host_gid=1001
RUN groupadd -g $host_gid $USER_NAME && \
    useradd -g $host_gid -m -s /bin/bash -u $host_uid $USER_NAME

USER $USER_NAME 
ENV BUILD_DIR /home/$USER_NAME/yocto
RUN mkdir -p $BUILD_DIR
COPY condition.sh ${BUILD_DIR}/condition.sh 
# Клонирование репозитория Poky
WORKDIR $BUILD_DIR
RUN git clone git://git.yoctoproject.org/poky

# Установка переменных окружения
ENV TEMPLATECONF=$BUILD_DIR/poky/meta-poky/conf/templates/default

# Создание docker volume для сохранения исходных файлов
VOLUME ["/home"]