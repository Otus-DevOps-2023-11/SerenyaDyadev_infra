# SerenyaDyadev_infra
SerenyaDyadev Infra repository

в папке packer добавлены файлы согласно ДЗ

Запуск виладиции 
packer validate -var-file=./variables.json ubuntu16.json

Запуск сборки образа
packer build -var-file=./variables.json ubuntu16.json


Доп дз 10 пункт
packer build -var-file=./variables.json immutable.json
Собирается образ с автозапуском reddit

create-reddit-vm.sh
запуск скрипта создает ВМ из образа созданного выше

