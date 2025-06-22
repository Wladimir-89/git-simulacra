#!/bin/bash
set -e

echo "Возврат назад"
echo "Команда git reset"

if command -v git > /dev/null 2>&1;
then
  echo "Git версии $(git --version) установлен на хосте $(hostname -f)"

  # Шоттс: Инициализируем bare-репозиторий — сердце нашего локального Git-вселенной
  mkdir -p git-reset-example-remote
  cd git-reset-example-remote || { echo "Невозможно найти каталог"; exit 1;}
  git init --bare resetremote.git
  cd ..

  # Шоттс: Клонируем репозиторий для работы — создаём нашу локальную копию реальности
  git clone ./git-reset-example-remote/resetremote dev1
  cd dev1

  echo "Шоттс: Первый акт — создаём файл с приветствием"
  echo "Привет, мир!" > file.txt
  git add file.txt
  git status
  git commit -m "added file.txt"

  echo "Бодрийяр: Вторая сцена — добавляем изменения, словно переписываем судьбу"
  echo "Добавлено что-то" >> file.txt
  git add file.txt
  git commit -m "changed file.txt"

  echo "Шоттс: Открываем новую ветку — путь альтернативной реальности"
  git switch -c sideline

  echo "Бодрийяр: Добавляем новый файл — создаём новую грань симулякра"
  echo "Это другой файл" > example.md
  git add example.md
  git commit -m "added example.md"

  echo "Бодрийяр: Вносим изменения — отражаем изменчивость мира"
  echo "Некоторые изменения" >> example.md
  git add example.md
  git commit -m "changed example.md"

  echo "Шоттс: Заглянем в историю до отката"
  git log --oneline

  echo "Бодрийяр: Возвращаемся назад во времени — git reset --hard HEAD~1"
  # Для уверенности переключимся на main (или master, если надо поменять)
  git switch main
  git reset --hard HEAD~1

  echo "Шоттс: История после отката — видим, как изменился путь"
  git log --oneline

  echo "Шоттс: Отправляем изменения с силой (force), чтобы переписать удалённую реальность"
  git push --force origin main

else
  echo "Установите Git — иначе путь невозможен"
fi

  
  
