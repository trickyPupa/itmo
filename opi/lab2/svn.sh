#!/bin/bash

SVN_REPO="$(realpath ./svn_repo)"
WORKING_DIR="$(realpath ./svn_working)"
COMMITS_DIR="$(realpath ./commits)"

# Очистка
rm -rf "$SVN_REPO" "$WORKING_DIR"
mkdir -p "$SVN_REPO" "$WORKING_DIR"

# Инициализация репозитория
svnadmin create "$SVN_REPO"
svn mkdir "file://$SVN_REPO/trunk" "file://$SVN_REPO/branches" "file://$SVN_REPO/tags" -m "лооол"
svnserve -d -r "$SVN_REPO"

# 0 -- init коммит (красный юзер)
svn checkout "file://$SVN_REPO/trunk" "$WORKING_DIR/trunk"
cd "$WORKING_DIR/trunk"
cp -r "$COMMITS_DIR/0"/* .
svn add --force .
svn commit --username red_user -m "коммит0"

# 1 -- бренч1 от 0 (синий юзер)
svn copy "file://$SVN_REPO/trunk" "file://$SVN_REPO/branches/branch1" -m "1 ветка"
svn checkout "file://$SVN_REPO/branches/branch1" "$WORKING_DIR/branch1"
cd "$WORKING_DIR/branch1"
cp -r "$COMMITS_DIR/1"/* .
svn add --force .
svn commit --username blue_user -m "коммит1"

# 2 -- бренч2 от 1 (синий юзер)
svn copy "file://$SVN_REPO/branches/branch1" "file://$SVN_REPO/branches/branch2" -m "2 ветка"
svn checkout "file://$SVN_REPO/branches/branch2" "$WORKING_DIR/branch2"
cd "$WORKING_DIR/branch2"
cp -r "$COMMITS_DIR/2"/* .
svn add --force .
svn commit --username blue_user -m "коммит2"

# 3 -- коммит в транке после 0 (красный юзер)
cd "$WORKING_DIR/trunk"
svn update
cp -r "$COMMITS_DIR/3"/* .
svn add --force .
svn commit --username red_user -m "коммит3"

# 4 -- коммит в транке после 3 (красный юзер)
cp -r "$COMMITS_DIR/4"/* .
svn add --force .
svn commit --username red_user -m "коммит4 Взорвите Мурино"

# 5 -- коммит в транке после 4 (красный юзер)
cp -r "$COMMITS_DIR/5"/* .
svn add --force .
svn commit --username red_user -m "Коммит 5 спасите Б6"

# 6 -- коммит в бренче2 после 2 (синий юзер)
cd "$WORKING_DIR/branch2"
svn update
cp -r "$COMMITS_DIR/6"/* .
svn add --force .
svn commit --username blue_user -m "коммит 6"

# Мердж 6 в trunk (создаем коммит 7)
cd "$WORKING_DIR/trunk"
svn update
svn merge --accept postpone "file://$SVN_REPO/branches/branch2"
cp -r "$COMMITS_DIR/7"/* .
svn add --force .
svn commit --username red_user -m "коммит7 кикфлип подушкой"

svn resolve --accept working F.java
svn resolve --accept working K.java

cp -r "$COMMITS_DIR/7"/* .
svn add --force .
svn commit --username red_user -m "коммит7 кикфлип подушкой (разрешены конфликты)"

# 8 -- коммит в транке после 7 (красный юзер)
cp -r "$COMMITS_DIR/8"/* .
svn add --force .
svn commit --username red_user -m "коммит8 первая додо пицца открылась в сыктывкаре"

# 9 -- коммит в транке после 8 (красный юзер)
cp -r "$COMMITS_DIR/9"/* .
svn add --force .
svn commit --username red_user -m "коммит9 вчера видел как в метро остановили таджика, было забавно"

# 10 -- коммит в транке после 9 (красный юзер)
cp -r "$COMMITS_DIR/10"/* .
svn add --force .
svn commit --username red_user -m "коммит10 сегодня я поел сырников"

# 11 -- коммит в бренч1 после 1 (синий юзер)
cd "$WORKING_DIR/branch1"
svn update
cp -r "$COMMITS_DIR/11"/* .
svn add --force .
svn commit --username blue_user -m "коммит11 возвращение блудного сына"

# 12 -- коммит в бренч1 после 11 (синий юзер)
cp -r "$COMMITS_DIR/12"/* .
svn add --force .
svn commit --username blue_user -m "коммит12 я устал это делать"

# 13 -- коммит в бренч1 после 12 (синий юзер)
cp -r "$COMMITS_DIR/13"/* .
svn add --force .
svn commit --username blue_user -m "коммит13 финал?"

# Мердж 13 в trunk (коммит 14)
cd "$WORKING_DIR/trunk"
svn update
svn merge --accept postpone "file://$SVN_REPO/branches/branch1"

svn resolve --accept working F.java
svn resolve --accept working K.java
svn resolve --accept working jYzbZGr65h.ldT

cp -r "$COMMITS_DIR/14"/* .
svn add --force .

svn delete F.java.working
svn delete K.java.working

svn commit --username red_user -m "коммит14 твоя следующая фраза -- мердж конфликт"

svn cleanup


echo ...................................................................................
echo ......................................:-==:........................................
echo ................................:**************##:.................................
echo ..............................#****############*###%@*.............................
echo ............................=#*##########%%@%%%%%%##%%%=...........................
echo ...........................*#######%##########%%%%%@%#%%=..........................
echo ..........................*%##%%##%%@%%##**#%%%%%%%#%%%%%#:........................
echo .........................*%%%%%#*==---==========++==+*##%%#........................
echo .........................#%%@#+==-----------------=====*#%#+.......................
echo ........................+%%*====------------------======*#%#.......................
echo ........................*#*+====--------------------=====*#*:......................
echo ........................**+====----------------------====***:......................
echo ........................**+===-----------------------====+*#.......................
echo ........................*+=====----------------------=====**.......................
echo ........................*====*+*****++=---====++++++++====+*.......................
echo ........................=+==+=======++======+++===+++++===*+.......................
echo .........................=====++*#*++++==-====+#%%*++=====*........................
echo .......................+=================-===-========-===++#......................
echo ......................:*++==---------=========---------===++*......................
echo .......................+++==---------=========---------===+=.......................
echo .......................:+===---------=+==--===---------===+=.......................
echo ........................+====-------=++++++*+==-------=====:.......................
echo ........................======------=====--====-------=====........................
echo ..........................:===-----------=------------===..........................
echo ...........................====-----===++++++===------==-..........................
echo ...........................:====----=++*+++++++=----====...........................
echo ............................:====--==-===++====-==-====............................
echo ..............................===========--===========.............................
echo ..............................======------------===+==:............................
echo .............................:====++============++====--*..........................
echo ...........................:#-=======++++==++++=======:-#%.........................
echo .........................:#%#-::====================-:::-%%#.......................
echo .......................+##%%%-::::=======-=========.::::-%%%%%=....................
echo ..................-#%%#%%%%%%::::..:===========---..::::-%%@%%%%%#*................
echo ..............:#%%%%%%%%%%%%%-::::...:=========-:-.:::::=%%@@@@%@%%%%#*............
echo ...........*#%%%%%%%@%%%%%%%%+::::.:::::..-===::::--::::*%%%%@@@@@%%%%%%%#:........
echo .......+#%%%%%%%%%%%%@%%%%%%%#:::::::::::::+::::..::::::%%%%%%@@%%%%%%%%%%%%#=.....
echo ..:+#%%%%%%%%%%%%@@%%%%%%@@%%%::-..........:.:.......:::%%%@@@@@%@@@%%%%%%%%%%%%#*:
echo "##%%%%%%%%%%%%%%%@@@@@@@@@@@%%:-:....................::+%%@@%@@*#@@@@@@@@@%%%%%%%%%"
echo "##%%%%%%%%%@%@@@@@@@@@@@@@@@@%*..:...................::%@@@@%@##*@@@@@@@@@@@@@@%%%%"
echo "#%%%%%%%%%%%%@@@@@@@@@@@@@@@@%%:.:..................:.:%@@@@@@@@@@@@@@@@@@@@@@@@%%%"
echo %%%%%%%%%%@@@@@@@@@@@@@@@@@@@%%-....................::*%@@@@@@@@@@@@@@@@@@@@@@@@@@%
echo %%%%%%%%%@@@@@@@@@@@@@@@@@@@@@%#....................:-%@%@@@@@@@@@@@@@@@@@@@@@@@@@%
echo %%%%%%%%%@@@@@@@@@@@@@@@@@@@@@@%:..........:.........=%%%@@@@@@@@@@@@@@@@@@@@@@@@@@
echo %%%%%%%%%@@@@@@@@@@@@@@@@@@@@@@%+....................%%@@@@@@@@@@@@@@@@@@@@@@@@@@%@
echo %%%%%%%@@@@@@@@@@@@@@@@@@@@@@@@@%...................-%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

echo " _______  ______ "
echo "|__  /\ \/ / ___|"
echo "  / /  \  / |    "
echo " / /_  /  \ |___ "
echo "/____|/_/\_\____|"

svn status
