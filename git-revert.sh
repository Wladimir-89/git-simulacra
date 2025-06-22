#!/bin/bash

echo "Отмена коммита"
echo "Команда git revert"

if command -v git > /dev/null 2>&1;
then
  echo "Гит установлен версии $(git --version)"

  # Шоттс: Инициализируем чистую историю — начинаем с main
  mkdir -p git-revert-example
  cd git-revert-example || { echo "Каталог не найден"; exit 1; }
  git init --quiet --initial-branch=main

  echo "Шоттс: Создаём файл с приветствием"
  echo "Привет, мир!" > file.txt
  git add file.txt
  git status
  git commit -m "added file.txt"

  echo "Бодрийяр: Добавляем вторую строку — мир меняется"
  echo "Привет, мир!" >> file.txt
  git add file.txt
  git commit -m "another line in file.txt"

  echo "Бодрийяр: Третья строка — как очередной штрих в портрете"
  echo "Привет, мир!" >> file.txt
  git add file.txt
  git commit -m "third line in file.txt"

  echo "Шоттс: История до отмены — три шага вперёд"
  git log --oneline

  echo "Бодрийяр: Команда git revert — как акт раскаяния, который создаёт новый коммит, отменяющий предыдущий"
  git revert --no-edit HEAD

  echo "Шоттс: История после отмены — путь не разрушен, а расширен"
  git log --oneline
else
  echo "Гит не установлен — остановись и установи"
fi

