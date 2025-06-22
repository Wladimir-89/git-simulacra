#!/bin/bash
set -e

echo "Временное укрытие" 
echo "Команда git stash"

if command -v git > /dev/null 2>&1;
then
  echo "✅ Гит версии $(git --version) установлен"

  # Шоттс: Создаём репозиторий, где будет разыгрываться драма укрытия изменений
  mkdir -p git-stash-example
  cd git-stash-example || { echo "Каталог не найден"; exit 1; }
  git init --quiet --initial-branch=main

  echo "Шоттс: Первый акт — добавляем файл с приветствием"
  echo "Привет, мир!" > example.txt
  git add example.txt
  git commit -m "added example.txt"

  echo "Бодрийяр: Вносим изменения, которые пока не готовы к свету"
  echo "Снова привет, мир!" >> example.txt
  git add example.txt
  git status

  echo "Бодрийяр: Спрячем эти изменения в тайник — git stash с флагом -u для учёта новых файлов"
  git stash -u

  echo "Шоттс: Переходим в новую ветку — место убежища"
  git switch -c shelter

  echo "Бодрийяр: Добавляем важный файл комментария в новой реальности"
  echo "Комментарий" > comment.md
  git add comment.md
  git commit -m "добавлен comment.md"

  echo "Шоттс: Возвращаемся в main, где нас ждут спрятанные изменения"
  git switch main

  echo "Бодрийяр: Достаем наши укрытые изменения обратно — git stash pop"
  git stash pop

  git status

else
  echo "Установите git — без него укрытия невозможны"
fi

  

