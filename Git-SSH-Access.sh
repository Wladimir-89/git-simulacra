#!/bin/bash

set -e

echo "Episode 2:"
echo "---"
echo "В котором мы учимся настраивать SSH к удаленному репозиторию"

EMAIL="your_email@example.com"

if command -v git > /dev/null 2>&1; then
  echo "Git установлен: $(git --version)"

  echo "Проверка SSH-ключей:"
  if [[ -f ~/.ssh/id_ed25519 && -f ~/.ssh/id_ed25519.pub ]]; then
    echo "У вас уже есть SSH-ключи:"
    ls -l ~/.ssh/id_ed25519*
  else
    echo "Ключей нет — создаём новые:"
    ssh-keygen -t ed25519 -C "$EMAIL"
  fi

  echo "Ваш публичный ключ:"
  cat ~/.ssh/id_ed25519.pub

  echo "Запускаем ssh-agent и добавляем ключ:"
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
  ssh-add -l

  echo "Проверка соединения с GitHub:"
  ssh -T git@github.com

  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Настройка origin для текущего репозитория:"
    git remote set-url origin git@github.com:username/repository.git
  else
    echo "Вы не в git-репозитории. Пропускаем настройку origin."
  fi
else
  echo "Установите git"
fi

