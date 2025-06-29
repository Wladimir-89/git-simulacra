#!/bin/bash
set -e

# Шоттс: git clone — это первый жест ученика, решившего войти в знание.
# Бодрийяр: Ха! Ты думаешь, он берет знание? Он клонирует форму — симулякр, иллюзию участия.

echo "Клонирование"
echo "Команда git clone"

# Шоттс: фиксируем дату, пользователя и хост — след ученика.
# Бодрийяр: Ты фиксируешь события, как будто они реальны. Всё это — эхо кода.

DATE=$(date)
USER_GIT=$(whoami)
HOST=$(hostname -i)

# Шоттс: проверим, установлен ли git.
# Бодрийяр: Ты вызываешь бинарного духа, надеясь на его присутствие.

if command -v git > /dev/null 2>&1;
then
  # Шоттс: создаём рабочую директорию.
  # Бодрийяр: Место? Ты создаёшь иллюзию пространства в пустоте.
  mkdir -p git-clone-example
  cd git-clone-example || { echo "Невозможно перейти в каталог"; exit 1;}

  # Шоттс: проверим — вдруг репозиторий уже клонирован?
  # Бодрийяр: Ты боишься двойника. Но ведь симулякр уже произошёл.
  if [ -d "The-Linux-Command-Line_William-Shots" ];
  then
    echo "Репозиторий уже клонирован"
  else
    # Шоттс: вот оно — клонирование как ритуал вхождения.
    # Бодрийяр: Ритуал пуст. Ты копируешь знаки, не смыслы.
    git clone --progress https://github.com/mehransab101/The-Linux-Command-Line_William-Shots.git 
    echo "Клонирование выполнено"
  fi

  # Шоттс: зафиксируем акт клонирования.
  # Бодрийяр: Зафиксируй симулякр, если можешь — это уже тень.
  echo "cloned at $DATE by $USER_GIT on $HOST"

  # Шоттс: теперь можно увидеть структуру.
  # Бодрийяр: Ты смотришь в зеркало. ls -la как отражение внутренней пустоты.
  echo "Можно посмотреть содержимое:"
  ls -la
  cd ..
else
  # Шоттс: если git не установлен — предложим исправить.
  # Бодрийяр: Возможно, отсутствие git — это шанс на подлинность.
  echo "Установите git"
fi

