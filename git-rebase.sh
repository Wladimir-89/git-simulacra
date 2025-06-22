##!/bin/bash
set -e

echo "Переписать историю"
echo "Команда git rebase"

if command -v git > /dev/null 2>&1;
then
  echo "Всё хорошо, версия git: $(git --version) установлена на $(hostname -f)"
  mkdir -p git-rebase-example-remote
  cd git-rebase-example-remote || { echo "Невозможно найти каталог"; exit 1; }
  git init --bare remote.git
  cd ..

  git clone ./git-rebase-example-remote/remote.git dev
  cd dev

  echo "Шоттс: Создаём первый файл — пример приветствия миру"
  echo "Привет, МИР!" > example.txt
  git add example.txt
  git commit -m "added example.txt"

  echo "Шоттс: Добавляем пустой файл, на всякий случай"
  echo "Просто пустой файл" > text.md
  git add text.md
  git commit -m "added text.md"

  tree -aL 1 || echo "Команда tree не установлена — пропускаем"

  echo "Шоттс: Создаём новую ветку для экспериментов"
  git switch -c sidebranch

  echo "Бодрийяр: Добавим изменения, чтобы потом их пересобрать и переписать историю — наш маленький ритуал."
  echo "Добавим что-то" >> text.md
  git add text.md
  git commit -m "text.md changed"

  echo  "Шоттс: Переписываем историю — накладываем изменения ветки sidebranch поверх main"
  git rebase main

  git log --oneline

  echo "Шоттс: Отправляем изменения в удалённый репозиторий"
  git push origin main

  cd ..

  echo "Шоттс: Клонируем репозиторий заново для проверки"
  git clone ./git-rebase-example-remote/remote.git ops
  cd ops

  git pull origin main

  tree -aL 1 || echo "Команда tree не установлена — пропускаем"

else
  echo "Установите git"
fi

