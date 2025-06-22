#!/bin/bash

set -e

# Шоттс: Проверим, установлен ли Git
# Бодрийяр: Инструмент есть — значит, симуляция возможна.
if command -v git > /dev/null 2>&1;
then
  echo " Git версии $(git --version) установлен на хосте: $(hostname -f)"

  #  Шоттс: Создаём bare-репозиторий — центральный узел
  mkdir -p git-push-example 
  cd git-push-example || { echo " Невозможно перейти в каталог"; exit 1; }
  git init --bare push.git

  cd ..

  # Шоттс: Переходим в рабочую копию
  mkdir -p dev1
  cd dev1 || { echo " Не удалось перейти в каталог dev1"; exit 1; }

  # Шоттс: Клонируем локальный удалённый репозиторий
  git clone ../git-push-example/push.git

  cd push || { echo " Не удалось перейти в клонированный репозиторий"; exit 1; }

  # Шоттс: Создаём четыре файла с диагностикой
  echo "$(git --version)" > info.txt
  echo "$(date)" > info1.txt
  echo "$(whoami)" > info2.txt
  echo "$(hostname -f)" > info3.txt

  # Шоттс: Добавляем и фиксируем изменения
  git add .
  git status
  git commit -m "added four files with system info"
  git log --oneline

  # Шоттс: проверяем на наличие установленной команды tree)
  if command -v tree > /dev/null 2>&1; 
then
  tree -aL 1
else
   echo "(tree не установлен)"
fi

  # Шоттс: Отправляем изменения
  git push origin main

  cd ../../git-push-example/push.git
  echo "Содержимое bare-репозитория:"
  ls -l

else
  echo "Git не установлен. Установите его."
  # Бодрийяр: Без git — нет структуры. А без структуры — только хаос бытия.
fi

