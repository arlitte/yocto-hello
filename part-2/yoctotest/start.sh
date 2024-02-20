#!/bin/bash
#Создание тома
docker volume create y-vol
#Сборка докер-образа. Запуск в директории с Dockerfile и condition.sh
docker build . --tag ytest
#Docker run для сборки образа
docker run -v y-vol:/home -it --env BUILD_FLAG=build_yocto ytest sh /home/head/yocto/condition.sh
#Docker run для запуска образа в qemu
docker run -v y-vol:/home -it --env BUILD_FLAG=run_yocto ytest sh /home/head/yocto/condition.sh
