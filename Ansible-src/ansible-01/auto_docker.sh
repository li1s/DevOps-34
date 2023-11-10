#!/bin/bash
clear
name=("fedora" "centos7" "ubuntu" )
image=("pycontribs/fedora" "pycontribs/centos:7" "pycontribs/ubuntu:latest" )

for i in ${image[@]}; do
   case $i in
   pycontribs/fedora)
     docker run -dit --name ${name[0]} $i bash
     ;;
   pycontribs/centos:7)
     docker run -dit --name ${name[1]} $i bash
     ;;
   pycontribs/ubuntu:latest)
     docker run -dit --name ${name[2]} $i bash
     ;;
   esac
done
echo ""
echo "Контейнеры запущены"
sleep 5
echo ""
echo "Запускаем Ansible playbook"
sleep 5
ansible-playbook -i ./inventory/prod.yml site.yml

echo "Останавливаем контейнеры"
docker stop $(docker ps -q)