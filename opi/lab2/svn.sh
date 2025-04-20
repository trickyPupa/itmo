#!/bin/bash

# Создание локального репозитория
svnadmin create repo
REPO_URL="file://$(pwd)/repo"


# Создаём структуру проекта
cd repo
svn mkdir -m "project structure" $REPO_URL/trunk $REPO_URL/branches
cd ..

# Создание рабочей копии
svn checkout $REPO_URL/trunk/ wc
cd wc


# Ревизия r0 (пользователь 1) {
unzip -o commits/commit0.zip -d src
svn add *
svn commit -m "Initial commit (r0)" --username=red
echo "- Коммит 0 (red)"
# }

svn update

# r1 (пользователь 2) {
svn copy $REPO_URL/trunk $REPO_URL/branches/branch2 -m "Creating branch2"
svn switch $REPO_URL/branches/branch2

svn rm * --force

unzip -o commits/commit1.zip -d src
svn add *
svn commit -m "r1" --username=blue
echo "- Коммит 1 (blue)"
# }

svn update

# r2 пользователь 2 {
svn copy $REPO_URL/branches/branch2 $REPO_URL/branches/branch3 -m "Creating branch3"
svn switch $REPO_URL/branches/branch3

svn rm * --force

unzip -o commits/commit2.zip -d src
svn add *
svn commit -m "r2" --username=blue
echo "- Коммит 2 (blue)"
# }


# r3-r5 (пользователь 1) {
svn switch $REPO_URL/trunk

svn rm *
unzip -o commits/commit3.zip -d src
svn add *
svn commit -m "r3" --username=red
echo "- Коммит 3 (red)"

svn rm *
unzip -o commits/commit4.zip -d src
svn add *
svn commit -m "r4" --username=red
echo "- Коммит 4 (red)"

svn rm *
unzip -o commits/commit5.zip -d src
svn add *
svn commit -m "r5" --username=red
echo "- Коммит 5 (red)"
# }


# r6 (пользователь 2) {
svn switch $REPO_URL/branches/branch3

svn rm *
unzip -o commits/commit6.zip -d src
svn add *
svn commit -m "r6" --username=blue
echo "- Коммит 6 (blue)"
# }

# Мердж ревизии r6 с r5 # {
svn switch $REPO_URL/trunk
svn merge $REPO_URL/branches/branch3

nano Lab4.java
svn resolved Lab4.java

## TODO
##
## ИСПРАВЛЕНИЕ КОНФЛИКТА
##

svn add *
echo "- Слияние r6 и r5"

# Отменяем merge в случае отмены
# git merge --abort


# Ревизии r7-r10 (пользователь 1) {
svn rm * --force
unzip -o commits/commit7.zip -d src
svn add *
svn commit -m "r7" --username=red
echo "- Коммит 7 (red)"

svn rm *
unzip -o commits/commit8.zip -d src
svn add *
svn commit -m "r8" --username=red
echo "- Коммит 8 (red)"

svn rm *
unzip -o commits/commit9.zip -d src
svn add *
svn commit -m "r9" --username=red
echo "- Коммит 9 (red)"

svn rm *
unzip -o commits/commit10.zip -d src
svn add *
svn commit -m "r10" --username=red
echo "- Коммит 10 (red)"
# }


# Ревизия r11-r13 (пользователь 2) {
svn switch $REPO_URL/branches/branch2

svn rm *
unzip -o commits/commit11.zip -d src
svn add *
svn commit -m "r11" --username=blue
echo "- Коммит 11 (blue)"

svn rm *
unzip -o commits/commit12.zip -d src
svn add *
svn commit -m "r12" --username=blue
echo "- Коммит 12 (blue)"

svn rm *
unzip -o commits/commit13.zip -d src
svn add *
svn commit -m "r13" --username=blue
echo "- Коммит 13 (blue)"
# }

# Мердж ревизии r13 с r10 # {
svn switch $REPO_URL/trunk

svn merge $REPO_URL/branches/branch2

nano Lab4.java
svn resolved Lab4.java

## TODO
## ИСПРАВЛЕНИЕ КОНФЛИКТА ВРУЧНУЮ
##

svn add *
echo "- Слияние r13 и r10"

# Отменяем merge в случае отмены
# git merge --abort

svn rm *
unzip -o commits/commit14.zip -d src
svn add *
svn commit -m "r14" --username=red
echo "- Коммит 14 (red)"
# }

svn update
