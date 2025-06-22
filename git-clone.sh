#!/bin/bash
set -e
echo "Клонирование"
echo "Команда git clone"

DATE=$(date)
USER_GIT=$(whoami)
HOST=$(hostname -i)

if command -v git > /dev/null 2>&1;
then
  mkdir -p git-clone-example
  cd git-clone-example || { echo "Невозможно перейти в каталог"; exit 1;}
    if [ -d "The-Linux-Command-Line_William-Shots" ];
    then
      echo "Репозиторий уже клонирован"
    else
  
  git clone --progress https://github.com/mehransab101/The-Linux-Command-Line_William-Shots.git 
  echo "Клонирование выполнено"
  fi
  echo "cloned at $DATE by $USER_GIT on $HOST"
  echo "Можно посмотреть содержимое:"
  ls -la
  cd ..
else
  echo "Установите git"
fi

