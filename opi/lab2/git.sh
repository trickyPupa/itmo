#!/bin/bash


git init
echo "- git init"


# Настройка пользователей
git config user.name "red"
git config user.email "red@example.com"
echo "- Пользователь red создан"


git checkout -b branch1

# Ревизия r0 (пользователь 1) {
unzip -o commits/commit0.zip -d src
git add .
git commit -m "Initial commit (r0)"
echo "- Коммит 0 (red)"
# }


# r1 (пользователь 2) {
git checkout -b branch2

unzip -o commits/commit1.zip -d src
git add .
git commit -m "r1" --author="blue <blue@example.com>"
echo "- Коммит 1 (blue)"
# }

# r2 пользователь 2 {
git checkout -b branch3

unzip -o commits/commit2.zip -d src
git add .
git commit -m "r2" --author="blue <blue@example.com>"
echo "- Коммит 2 (blue)"
# }


# r3-r5 (пользователь 1) {
git checkout -b branch1

unzip -o commits/commit3.zip -d src
git add .
git commit -m "r3"
echo "- Коммит 3 (red)"

unzip -o commits/commit4.zip -d src
git add .
git commit -m "r4"
echo "- Коммит 4 (red)"

unzip -o commits/commit5.zip -d src
git add .
git commit -m "r5"
echo "- Коммит 5 (red)"
# }


# r6 (пользователь 2) {
git checkout branch3

unzip -o commits/commit6.zip -d src
git add .
git commit -m "r6" --author="blue <blue@example.com>"
echo "- Коммит 6 (blue)"
# }

# Мердж ревизии r6 с r5 # {
git checkout branch1

# Эта опция сохранит вашу версию файла (ветку, из которой выполняется слияние) в случае конфликта
# git merge --no-commit branch3 -Xours

# Эта опция сохранит версию файла из ветки, с которой выполняется слияние, в случае конфликта
# git merge --no-commit branch3 -Xtheirs

git merge --no-commit branch3

git add .
echo "- Слияние r6 и r5"

# Отменяем merge в случае отмены
# git merge --abort


# Ревизии r7-r10 (пользователь 1) {
unzip -o commits/commit7.zip -d src
git add .
git commit -m "r7"
echo "- Коммит 7 (red)"

unzip -o commits/commit8.zip -d src
git add .
git commit -m "r8"
echo "- Коммит 8 (red)"

unzip -o commits/commit9.zip -d src
git add .
git commit -m "r9"
echo "- Коммит 9 (red)"

unzip -o commits/commit10.zip -d src
git add .
git commit -m "r10"
echo "- Коммит 10 (red)"
# }


# Ревизия r11-r13 (пользователь 2) {
git checkout branch2

unzip -o commits/commit11.zip -d src
git add .
git commit -m "r11" --author="blue <blue@example.com>"
echo "- Коммит 11 (blue)"

unzip -o commits/commit12.zip -d src
git add .
git commit -m "r12" --author="blue <blue@example.com>"
echo "- Коммит 12 (blue)"

unzip -o commits/commit13.zip -d src
git add .
git commit -m "r13" --author="blue <blue@example.com>"
echo "- Коммит 13 (blue)"
# }

# Мердж ревизии r13 с r10 # {
git checkout branch1

# Эта опция сохранит вашу версию файла (ветку, из которой выполняется слияние) в случае конфликта
# git merge --no-commit branch3 -Xours

# Эта опция сохранит версию файла из ветки, с которой выполняется слияние, в случае конфликта
# git merge --no-commit branch3 -Xtheirs

git merge --no-commit branch2


##
## ИСПРАВЛЕНИЕ КОНФЛИКТА ВРУЧНУЮ
##

git add .
echo "- Слияние r13 и r10"

# Отменяем merge в случае отмены
# git merge --abort

unzip -o commits/commit14.zip -d src
git add .
git commit -m "r14"
echo "- Коммит 14 (red)"

# }


# Вывод графа
git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all