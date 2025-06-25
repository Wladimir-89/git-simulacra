#!/bin/bash

echo "Создаем директорию init.station89 и переходим в неё"
mkdir -p init.station89
cd init.station89 || exit 1

echo "Инициализируем новый git-репозиторий"
git init

echo "Создаем README.md для первого коммита"
echo "# INIT.STATION89" > README.md

echo "Добавляем README.md в индекс"
git add README.md

echo "Делаем первый коммит"
git commit -m "init: first commit"

echo "Добавляем удаленный репозиторий (origin)"
git remote add origin github.com/Wladimir-89/init.station89.git

echo "Проверяем удаленные репозитории"
git remote -v

echo "Отправляем изменения в ветку main"
git branch -M main
git push -u origin main


