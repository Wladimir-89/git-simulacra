#!/bin/bash
set -euo pipefail 

echo "Episode_last:"
echo "---"
echo "В котором мы подводим итоги."

MAIN_DIR="Episode_3"
DEV_1="devops_1"
DEV_2="devops_2"
DEV_3="devops_3"

# Бодрийяр: "Git — это симулякр контроля, система отражений, где каждая команда — знак знака."
# Шоттс: "В ней закодирован путь — от пустоты репозитория к сложной сети ветвлений смыслов."

if command -v git > /dev/null 2>&1; then
  echo "Git $(git --version) на $(hostname -f) для $(whoami) установлен."

  mkdir -p "$MAIN_DIR"
  cd "$MAIN_DIR" || { echo "Невозможно перейти в каталог"; exit 1;}
  
  # Шоттс: "Bare-репозиторий — чистое поле, где пока нет объектов, лишь потенциал."
  # Бодрийяр: "Он лишён рабочего дерева, что делает его неким пустым местом смысла."
  git init --bare --initial-branch=main
  cd ..

  git clone ./"$MAIN_DIR" "$DEV_1"
  cd "$DEV_1" || { echo "Невозможно перейти в каталог"; exit 1;}
  
  echo "Git $(git --version) is installed on $(hostname -f) for $(whoami)." > info.txt
  echo "Today is $(date)" > date.txt
  cal > cal.txt

  git add .
  
  # Шоттс: "Добавление файлов — это акт выбора, выделения контента из хаоса."
  # Бодрийяр: "Но выбор этот иллюзорен, так как файлы — лишь знаки без внутренней сути."
  
  git status
  git commit -m "add info.txt, date.txt, cal.txt"
  
  # Шоттс: "Коммит — фиксация момента, свидетельство бытия в цифровом потоке."
  # Бодрийяр: "Но фиксация эта лишь след в зеркале отражений, игра смыслов."
  
  ls -lh
  git log --oneline

  git switch -c secondary

  echo "Uptime is $(uptime)" > time.txt
  git add time.txt
  
  git status
  ls -lh
  git commit -m "add time.txt"
  
  git merge main --no-edit
  
  # Бодрийяр: "Слияние — попытка восстановления целостности в фрагментированном пространстве."
  # Шоттс: "Конфликт здесь не всегда, но он всегда потенциально скрыт за гладью слияния."
  
  git push origin main
  cd ..

  git clone ./"$MAIN_DIR" "$DEV_2"
  cd "$DEV_2" || { echo "Невозможно перейти в каталог"; exit 1;}
  git pull origin main

  ls -lh

  echo "Я на $(hostname -f) работаю уже $(uptime)" > uptime.txt
  
  git status
  git add uptime.txt
  git commit -m "added uptime.txt"

  git stash

  git switch -c test1
  
  git branch

  echo "посмотрим адреса: $(ip a)" > ip.txt
  git add ip.txt
  git commit -m "added ip.txt"

  git revert HEAD
  
  git add ip.txt
  git commit -m "Мои айпишечки"

  git switch main
  
  echo "Всем привет" > replay.txt

  git commit -m "Я обозначился и добавил replay.txt"
  
  git branch

  git stash apply
  git push origin main
  cd ..

  git clone ./"$MAIN_DIR" "$DEV_3"
  cd "$DEV_3" || { echo "Невозможно перейти в каталог"; exit 1;}
  git pull origin main

  ls -lh

  echo "Я $(whoami) тут" > devops_3.txt
  git add devops_3.txt
  git commit -m "added devops_3.txt"

  git switch -c test2
  
  git branch

  echo "Работаю" > replay.txt
  git add replay.txt
  git commit -m "added replay.txt"

  git reset --hard HEAD

  ls -lh

  echo "Работаю" > replay.txt
  git add replay.txt
  git commit -m "А зачем это здесь?"

  git log --oneline

  git revert HEAD

  git rebase main
  
  git status

  # Шоттс: "Столкновение веток — момент истины, где смысл претерпевает трансформацию."
  # Бодрийяр: "Конфликт — не ошибка, а окно в глубокую природу симулякра."

  git add replay.txt
  git rebase --continue
  
  git switch main

  git log --oneline
  git push origin main
  cd ..
else
  echo "Установите git"
fi

