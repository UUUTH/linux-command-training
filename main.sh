#!/bin/bash

function introduction() {
  # Introduction
  echo -e "\e[31mLinuxコマンド学習シェル\e[0mを起動していただきありがとうございます。
  本シェルでは、　入力していただきながらLinuxコマンドを学んでいきます。
  説明が数行ずつ表示されるので、\e[7mエンターキー\e[0mで進めてください。"
  read -r
  echo -e "早速入力していただいてありがとうございます。
  では\e[31mコマンド\e[0mの学習を始めましょう。"
  read -r
  echo -e "コマンドというのは命令のことです。
  \e[31mCLI\e[0m、すなわち\e[31mコマンドラインインターフェイス\e[0mではコマンドで操作を行います。"
  read -r
  NEXT_STEP="ls"
  echo "ls" > save.txt
}

function about_ls() {
  # Study ly command
  echo -e "さて、最初のコマンドは\e[7mls\e[0mです
  lsコマンドは、ディレクトリーの内容を\e[31mリスト表示\e[0mするためのコマンドです"
  read -r
  echo -e "lsコマンドを使うと現在の場所にあるディレクトリーとファイルが見れます"
  read -r
  echo -e "lsコマンドを実行中..."
  sleep 1
  echo -e "========================="
  ls
  echo -e "=========================
  以上が現在ディレクトリーの内容です"
  read -r
  echo -e "今度はあなた自身で\e[7mls\e[0mコマンドを打ってみてください"
  read_word "^ls$"
  eval $READ_WORD_RESULT
  echo "
  lsコマンドにより現在ディレクトリーが表示されました
  このコマンドは一番よく使うので覚えておいてください"
  read -r

  # About files and directories
  echo -e "
  lsコマンドで表示されるものには２種類あります
  \e[31mファイル\e[0mと\e[31mディレクトリー\e[0mです"
  read -r
  echo "
  表示されたもののなかで、どれがディレクトリーでしょうか
  ディレクトリーだと思うものの名前を一つ選んで書いてください"
  ls
  read_word "^tutorial$"
  echo -e "
  正解です
  tutorialには.txtのような\e[31m拡張子\e[0mがついていません"
  read -r

  # ls -a command
  echo "
  ファイルには拡張子をつけることが多いですが
  実は、拡張子のないファイルも作成可能です"
  read -r
  echo "
  拡張子のないファイルがある場合でも
  それがファイルだと見分ける方法があります"
  read -r
  echo -e "
  今度はlsコマンドに特別な命令を付け加えます
  lsの後に半角スペースを空けて\e[7m-l\e[0mと打ってください
  小文字のエルです"
  read_word "^ls -l$"
  eval $READ_WORD_RESULT
  echo -e "
  -lは\e[31mファイル\e[0mの詳細を表示するオプションです
  各行の一番最初の文字を見てみてください"
  read -r
  echo -e "
  \e[31m-\e[0mと\e[31md\e[0mの二種類があります
  -はファイルを示し、dはディレクトリーを示します"
  read -r
  echo -e "
  また、-lのようなものを\e[31mオプション\e[0mといいます"
  read -r
  echo "オプションをコマンドの後ろにつけることで
  コマンドの動作を変えることができます"
  read -r
  NEXT_STEP="cd"
  echo "cd" > save.txt
}

function about_cd() {
  # Study cd command
  echo "
  次に移動するためのコマンドを打ってみましょう"
  read -r
  echo -e "
  tutorialに移動してみたいと思います
  そのためには\e[7mcd\e[0mコマンドというコマンドを使います"
  read -r
  echo -e "
  \e[7mcd\e[0mの後に半角スペースを空けてtutorialと打ってください"
  read_word "^cd tutorial$"
  eval $READ_WORD_RESULT
  echo -e "
  これで移動できました"
  read -r
  NEXT_STEP="pwd"
  echo "pwd" > ../save.txt
}

function about_pwd() {
  echo -e "
  今移動してきましたが、
  ログなどの出力がないので移動したのかどうかが分かりません"
  read -r
  echo -e "
  今どこにいるのかを確認するためのコマンドがあります
  それが\e[7mpwd\e[0mコマンドです"
  read -r
  echo -e "
  では\e[7mpwd\e[0mと打ってみてください"
  read_word "^pwd$"
  eval $READ_WORD_RESULT
  echo -e "
  このように\e[31m現在地のパス\e[0mが示されました。
  実際の開発では、ログ証跡を残す時や、
  削除などの重要な行動をする時によくpwdします。"
  read -r
  echo -e "
  覚える必要はありませんが、
  pwdは\e[31mp\e[0mrint \e[31mw\e[0morking \e[31md\e[0mirectoryの略です。"
  read -r
  NEXT_STEP="mkdir"
  echo "mkdir" > ../save.txt
}

function about_mkdir() {
  # Study mkdir command
  echo -e "
  今度は作る系のコマンドをやってみましょう。"
  read -r
  echo -e "
  普通のパソコンのエクスプローラーと同様、
  コマンドでも\e[31mディレクトリー\e[0mや\e[31mファイル\e[0mを作ることができます。
  そしてその二つを作るコマンドは別々にあります。"
  read -r
  echo -e "
  まずは\e[31mディレクトリー\e[0mを作ってみましょう。
  では\e[7mmkdir 作成したいディレクトリーの名前\e[0mと打ってみてください"
  read_word '^mkdir [a-zA-Z0-9]+[a-zA-Z0-9_]*$'
  while [ -d ./${READ_WORD_RESULT#* } ]
  do
    echo -e "同名ディレクトリーが既に存在しています。
    他の名前にしてください。"
    read_word '^mkdir [a-zA-Z0-9]+[a-zA-Z0-9_]*$'
  done
  eval $READ_WORD_RESULT
  echo -e "
  ディレクトリーが作られました。
  現ディレクトリーの内容を\e[31m詳細に\e[0m表示してみてください。"
  read_word "^ls -l$" "ls -l と打ってください" 3
  eval $READ_WORD_RESULT
  echo -e "
  作ったディレクトリーの行の一番左の文字が、
  ディレクトリーであることを示すdになっていると思います。"
  read -r
  echo -e "
  mkdirは\e[31mm\e[0ma\e[31mk\e[0me \e[31mdir\e[0mectoryの略です。"
  read -r
  NEXT_STEP="touch"
  echo "touch" > ../save.txt
}

function about_touch() {
  # Study touch command
  echo -e "
  ディレクトリー同様\e[31mファイル\e[0mも作ってみましょう。"
  read -r
  echo -e "
  ファイルはtouchコマンドで作ります。
  \e[7mtouch 作成したいファイル名\e[0m と打ってみてください。"
  read_word '^touch [a-zA-Z0-9]+[a-zA-Z0-9_.]*$'
  while [ -f ./${READ_WORD_RESULT#* } ]
  do
    echo -e "同名ファイルが既に存在しています。
    他の名前にしてください。"
    read_word '^touch [a-zA-Z0-9]+[a-zA-Z0-9_.]*$'
  done
  eval $READ_WORD_RESULT
  echo -e "
  ファイルが作られました。
  現ディレクトリーの内容を\e[31m詳細に\e[0m表示してみてください。"
  read_word "^ls -l$" "ls -l と打ってください" 3
  eval $READ_WORD_RESULT
  echo -e "
  作ったファイルの行の一文字目が\e[31m-\e[0mになっているはずです。"
  read -r
  NEXT_STEP="rmdir"
  echo "rmdir" > ../save.txt
}

function about_rmdir() {
  # Study rmdir command
  DIRECTORY_NAME=$(get_first_empty_directory_name)
  DIRECTORY_NAME=$(echo "$DIRECTORY_NAME" | sed 's|^\./||')
  if [ -z "$DIRECTORY_NAME" ]; then
    mkdir test
    DIRECTORY_NAME="test"
  fi
  echo -e "
  ディレクトリーとファイルを作りました。
  今度は消去も試してみましょう。"
  read -r
  echo -e "
  消去コマンドには二つあります。
  まずは\e[31m空の\e[0mディレクトリーの消去を行うコマンドを使ってみます。"
  read -r
  echo -e "\e[7mrmdir 消去したい空のディレクトリー名\e[0mコマンドを使って"
  echo $DIRECTORY_NAME"ディレクトリーを消してみましょう。"
  read_word "^rmdir $DIRECTORY_NAME$"
  eval $READ_WORD_RESULT
  echo -e "
  これで$DIRECTORY_NAMEが消えたはずです。
  \e[7mls\e[0mコマンドで確認してみましょう。"
  read_word "^ls$"
  eval $READ_WORD_RESULT
  echo -e "
  $DIRECTORY_NAMEが消えた事が確認できました。"
  read -r
  NEXT_STEP="rm1"
  echo "rm1" > ../save.txt
}

function about_rm1() {
  # Study rm file command
  FILE_NAME=$(get_first_file_name)
  if [ -z "$FILE_NAME" ]; then
    touch testfile.txt
    FILE_NAME=testfile.txt
  fi
  echo -e "
  空のディレクトリーを消去するコマンドがrmdirでしたが、
  そこからdirを取った\e[7mrm\e[0mは何でも消せるコマンドです。"
  read -r
  echo -e "
  なんでも消せてしまうので、意図しないものも消してしまうおそれがあります。
  基本的にはファイルを消すのに使用するのがいいと思います。"
  read -r
  echo -e "
  では、\e[7mrm 消去したいファイル名\e[0mで
  $FILE_NAMEを消してみましょう。"
  read_word "^rm $FILE_NAME$"
  eval $READ_WORD_RESULT
  echo -e "
  これで$FILE_NAMEが消えたはずです。
  現ディレクトリーの内容を表示してみましょう。"
  read_word "^ls$" "ls" 3
  eval $READ_WORD_RESULT
  echo -e "
  $FILE_NAMEが消えた事が確認できました。"
  read -r
  NEXT_STEP="rm2"
  echo "rm2" > ../save.txt
}

function about_rm2() {
  # Study rm directory with files command
  echo -e "
  rmコマンドではファイルが入ったディレクトリーも消せます。
  この作業を実際に行う場合は、必ずよく確認した上で行います。"
  read -r
  echo -e "
  まずは適当なディレクトリーを作りましょう。"
  read_word "^mkdir [a-zA-Z0-9]+[a-zA-Z0-9_]*$" "mkdir (新規ディレクトリー名)" 3
  DIRECTORY_NAME=${READ_WORD_RESULT:6}
  while [ -d ./${DIRECTORY_NAME#* } ]
  do
    echo -e "同名ディレクトリーが既に存在しています。
    他の名前にしてください。"
    read_word "^mkdir [a-zA-Z0-9]+[a-zA-Z0-9_]*$" "mkdir (新規ディレクトリー名)" 3
    DIRECTORY_NAME=${READ_WORD_RESULT:6}
  done
  eval $READ_WORD_RESULT
  echo -e "
  $DIRECTORY_NAMEディレクトリーが作られました。"
  read -r
  echo -e "
  現ディレクトリーを表示してみましょう。"
  read_word "^ls$" "ls" 3
  eval $READ_WORD_RESULT
  echo -e "
  $DIRECTORY_NAMEが作られていましたね。"
  read -r
  echo -e "
  次に\e[7mls ディレクトリー名\e[0mでディレクトリーの中身を見てください。"
  read_word "^ls $DIRECTORY_NAME$" "ls ディレクトリー名" 3
  eval $READ_WORD_RESULT
  echo -e "
  何も表示されませんでした。
  つまりこの$DIRECTORY_NAMEディレクトリーは空ということになります。"
  read -r
  echo -e "
  この$DIRECTORY_NAMEディレクトリーの中にファイルを作りましょう。"
  read -r
  echo -e "
  $DIRECTORY_NAMEの中に直接ファイルを作るので、
  \e[7mtouch $DIRECTORY_NAME/新規ファイル名\e[0mコマンドで作成します。"
  read_word "^touch $DIRECTORY_NAME/[a-zA-Z0-9]+[a-zA-Z0-9_.]*$" "touch $DIRECTORY_NAME/新規ファイル名" 3
  FILE_NAME=${READ_WORD_RESULT:6}
  while [ -f ./${FILE_NAME#* } ]
  do
    echo -e "同名ファイルが既に存在しています。
    他の名前にしてください。"
    read_word "^touch $DIRECTORY_NAME/[a-zA-Z0-9]+[a-zA-Z0-9_.]*$" "touch 新規ファイル名" 3
    FILE_NAME=${READ_WORD_RESULT:6}
  done
  eval $READ_WORD_RESULT
  echo -e "
  $FILE_NAMEが作られました。
  lsコマンドで$DIRECTORY_NAMEの中身を表示してください。"
  read_word "^ls $DIRECTORY_NAME$" "ls ディレクトリー名" 3
  eval $READ_WORD_RESULT
  echo -e "
  さっきは何も表示されませんでしたが、
  今は新規ファイルが表示されている筈です。"
  read -r
  echo -e "
  今$DIRECTORY_NAMEディレクトリーはファイルを含むディレクトリーです。
  そのためrmdirで消すことができません。"
  read -r
  echo -e "
  試しに\e[7mrmdir\e[0mコマンドで
  $DIRECTORY_NAMEを消してみてください。"
  read_word "^rmdir $DIRECTORY_NAME$" "rmdir $DIRECTORY_NAME" 3
  eval $READ_WORD_RESULT
  echo -e "
  想定通り、空のディレクトリーではないためエラーになりました。"
  read -r
  echo -e "
  では今度は\e[7mrm\e[0mを試してみましょう。"
  read_word "^rm $DIRECTORY_NAME$" "rm $DIRECTORY_NAME" 3
  eval $READ_WORD_RESULT
  echo -e "
  これもエラーになりました。"
  read -r
  echo -e "
  実はディレクトリーの削除には\e[7m-r\e[0mオプションを使います。"
  read -r
  echo -e "
  ではrmに-rオプションを付けて削除してみましょう。"
  read_word "^rm -r $DIRECTORY_NAME$" "rm -r $DIRECTORY_NAME" 3
  eval $READ_WORD_RESULT
  echo -e "
  これで削除できた筈です。
  現ディレクトリーを表示してみましょう。"
  read_word "^ls$" "ls" 3
  eval $READ_WORD_RESULT
  echo -e "
  削除できていますね。"
  read -r
  echo -e "
  ウィンドウズやマックのゴミ箱のような機能はないので、
  削除したファイル・ディレクトリーは復元できません。"
  read -r
  echo -e "
  くれぐれも気をつけて削除してください。"
  read -r
  NEXT_STEP="para1"
  echo "para1" > ../save.txt
}

function about_parameter1() {
  # Study about parameters
  echo -e "
  先ほどlsにディレクトリー名をつけてディレクトリーの中身を表示しました。
  同様に、他のコマンドでもコマンドの後に何かを入れることで動作が変わるものがあります。"
  read -r
  echo -e "
  この時、コマンドの後ろにつけるものを\e[31m引数(ひきすう)\e[0mといいます。
  因数と取り違えないため「ひきすう」と呼ぶと言われています。"
  read -r
  echo -e "
  lsの後ろに引数をつけると、そのディレクトリーの中身が見れます。
  復習がてら\e[31myasai\e[0mというディレクトリーの中身を見てみてください。"
  read_word "^ls yasai$" "ls yasai" 3
  eval $READ_WORD_RESULT
  echo -e "
  yasaiの中にいくつかディレクトリーがありましたね。
  今度はその中の任意のディレクトリーの中を見てみます。"
  read -r
  echo -e "
  ディレクトリーの配下に対して操作するには\e[31m/\e[0mを使います。
  今回であればyasaiの後に\e[31m/\e[0mを付けて、その後に任意の名前をつけます。
  ではlsでyasaiの中の任意のディレクトリーを見てみてください。"
  read_word "^ls yasai/(kinoko|kyuuri|ringo|tomato)$" "ls kinokoなど" 3
  eval $READ_WORD_RESULT
  echo -e "
  複数のファイルが表示されたと思います。
  /を付けるとどんな深い階層にも操作できます。"
  read -r
  echo -e "
  今度はファイルを開いて見たいと思います。
  ファイルを開くコマンドは\e[7mcat\e[0mです。"
  read -r
  echo -e "
  \e[7mcat\e[0mに対し、\e[31myasai\e[0mの中の\e[31mkinoko\e[0mの中の\e[31meringi.txt\e[0mを引数として指定して見てください。"
  read_word "^cat yasai/kinoko/eringi.txt$" "cat yasai/kinoko/eringi.txt" 3
  eval $READ_WORD_RESULT
  echo -e "
  eringi.txtの中身が表示されました。"
  read -r
  
  NEXT_STEP="para2"
  echo "para2" > ../save.txt
}

function about_parameter2() {
  # Practice using parameters
  echo -e "
  少し引数の練習をしていきたいと思います。"
  read -r
  echo -e "
  \e[31myasai\e[0mディレクトリーの中の\e[31mtomato\e[0mディレクトリーの中身を表示してください。"
  read_word "^ls yasai/tomato$" "ls yasai/tomato" 3
  eval $READ_WORD_RESULT
  echo -e "
  -lオプションを付けて\e[31mkudamono\e[0mディレクトリーの中の\e[31michigo\e[0mディレクトリーの中身を表示してください。"
  read_word "^ls -l kudamono/ichigo$" "ls -l kudamono/ichigo" 3
  eval $READ_WORD_RESULT
  echo -e "
  今表示したディレクトリーの中の任意のファイルを開いてみてください。"
  read_word "^cat kudamono/ichigo/(amaou|benihoppe|tochiotome).txt$" "cat yasai/kinoko/benihoppe.txtなど" 3
  eval $READ_WORD_RESULT
  echo -e "
  \e[31myasai\e[0mの中の\e[31mringo\e[0mの中の\e[31mmutsu.txt\e[0mを開いてください。"
  read_word "^cat yasai/ringo/mutsu.txt$" "cat yasai/ringo/mutsu.txt" 3
  eval $READ_WORD_RESULT
  echo -e "
  これで一旦一つの引数を使う場合の練習を終わりとします。"
  NEXT_STEP="mv1"
  echo "mv1" > ../save.txt
}

function about_mv1() {
  # Study mv command
  echo -e "
  今まで引数の練習をしてきました。
  ここでもう一度\e[31myasai\e[0mディレクトリーの中を見てみてください。"
  read_word "^ls yasai$" "ls ディレクトリー名" 3
  eval $READ_WORD_RESULT
  echo -e "
  ここに\e[31mringo\e[0mディレクトリーがありますが、\e[31mkudamono\e[0mディレクトリーにあるべきです。
  ringoディレクトリーをkudamonoディレクトリーに移動する必要があります。"
  read -r
  echo -e "
  ディレクトリーやファイルを移動するには\e[7mmv\e[0mコマンドを使います。
  このmvは二つの引数を使ってこのように書きます：
  \e[7mmv 移動元パス　移動先パス\e[0m"
  read -r
  echo -e "
  例えば\e[7mmv neko.txt doubutsu/neko.txt\e[0mと書くと、neko.txtがdoubutsuディレクトリーに移動します。"
  read -r
  echo -e "
  では\e[31myasai/ringo\e[0mを\e[31mkudamono/ringo\e[0mに移動してみましょう。"
  read_word "^mv yasai/ringo kudamono/ringo$" "mv 移動元 移動先" 3
  eval $READ_WORD_RESULT
  echo -e "
  移動できた筈です。
  確認のため\e[31myasai\e[0mディレクトリーを表示してください。"
  read_word "^ls yasai$" "ls ディレクトリー名" 3
  eval $READ_WORD_RESULT
  echo -e "
  ringoディレクトリーが無くなっていますね。"
  read -r
  echo -e "
  今度は\e[7mkudamono\e[0mディレクトリーを表示してください。"
  read_word "^ls kudamono$" "ls ディレクトリー名" 3
  eval $READ_WORD_RESULT
  echo -e "
  mvコマンドでは\e[7m移動元\e[0mと\e[7m移動先\e[0mを完全記述するようにしてください。"
  NEXT_STEP="mv2"
  echo "mv2" > ../save.txt
}

function about_mv2() {
  # Notice that mv can overwrite files/directory
  echo -e "
  mvコマンドではファイルの移動もできます。
  試しに適当な名前のファイルを作ってください。"
  read_word "^touch [a-zA-Z0-9]+[a-zA-Z0-9_.]*$" "touch ファイル名" 3
  while [ -f ./${READ_WORD_RESULT#* } ]
  do
    echo -e "同名ファイルが既に存在しています。
    他の名前にしてください。"
    read_word "^touch [a-zA-Z0-9]+[a-zA-Z0-9_.]*$" "touch ファイル名" 3
  done
  FILE_NAME=${READ_WORD_RESULT:6}
  eval $READ_WORD_RESULT
  echo -e "
  今度は適当な名前のディレトクリーを作ってください。"
  read_word "^mkdir [a-zA-Z0-9]+[a-zA-Z0-9_]*$" "mkdir ディレクトリー名" 3
  while [ -d ./${READ_WORD_RESULT#* } ]
  do
    echo -e "同名ディレクトリーが既に存在しています。
    他の名前にしてください。"
    read_word "^mkdir [a-zA-Z0-9]+[a-zA-Z0-9_]*$" "mkdir ディレクトリー名" 3
  done
  DIRECTORY_NAME=${READ_WORD_RESULT:6}
  eval $READ_WORD_RESULT
  echo -e "
  ファイルとディレクトリーが作れました。
  確認のため現在ディレクトリーの内容を表示してください。"
  read_word "^ls$" "ls" 3
  eval $READ_WORD_RESULT
  echo -e "
  では、\e[7mmv\e[0mで\e[31m$FILE_NAME\e[0mを\e[31m$DIRECTORY_NAME\e[0m配下に入れてください。"
  read_word "^mv $FILE_NAME $DIRECTORY_NAME/$FILE_NAME$" "mv 移動元 移動先" 3
  eval $READ_WORD_RESULT
  echo -e "
  移動できたかどうか確認するため$DIRECTORY_NAMEの内容を表示してください。"
  read_word "^ls $DIRECTORY_NAME$" "ls ディレクトリー名" 3
  eval $READ_WORD_RESULT
  echo -e "旧石器\n縄文\n弥生\n大和\n飛鳥\n奈良\n平安\n鎌倉\n室町\n安土桃山\n江戸\n明治\n大正\n昭和\n平成\n令和" > "$DIRECTORY_NAME/$FILE_NAME"
  echo -e "
  無事移動できましたね。
  このファイルに適当なデータを入力したので、ファイルを開いてみてください。"
  read_word "^cat $DIRECTORY_NAME/$FILE_NAME$" "cat ファイルパス" 3
  eval $READ_WORD_RESULT
  echo -e "
  時代区分が書かれていましたね。
  今度は、現在ディレクトリーにもう一つファイルを作ってください。"
  read_word "^touch [a-zA-Z0-9]+[a-zA-Z0-9_.]*$" "touch ファイル名" 3
  while [ -f ./${READ_WORD_RESULT#* } ]
  do
    echo -e "同名ファイルが既に存在しています。
    他の名前にしてください。"
    read_word "^touch [a-zA-Z0-9]+[a-zA-Z0-9_.]*$" "touch ファイル名" 3
  done
  FILE_NAME_2=${READ_WORD_RESULT:6}
  eval $READ_WORD_RESULT
  echo -e "α\nβ\nγ\nδ\nε\nζ\nη\nθ\nι\nκ\nλ\nμ\nν\nξ\nο\nπ\nρ\nσ\nτ\nυ\nφ\nχ\nψ\nω" > "$FILE_NAME_2"
  echo -e "
  このファイルにも適当なデータを入力したので、開いてみてください。"
  read_word "^cat $FILE_NAME_2$" "cat ファイルパス" 3
  eval $READ_WORD_RESULT
  echo -e "
  ギリシャ文字が書かれていますね。
  この\e[31m$FILE_NAME_2\e[0mを\e[31m$DIRECTORY_NAME\e[0mに\e[31m$FILE_NAME\e[0mとして移動してみてください。"
  read_word "^mv $FILE_NAME_2 $DIRECTORY_NAME/$FILE_NAME$" "mv 移動元 移動先" 3
  eval $READ_WORD_RESULT
  echo -e "
  そしたら$DIRECTORY_NAMEの内容を表示してください。"
  read_word "^ls $DIRECTORY_NAME$" "ls ディレクトリー名" 3
  eval $READ_WORD_RESULT
  echo -e "
  ここにある$FILE_NAMEの内容を表示してください。"
  read_word "^cat $DIRECTORY_NAME/$FILE_NAME$" "cat ファイルパス" 3
  eval $READ_WORD_RESULT
  echo -e "
  先ほどは時代区分が書かれていましたが、今はギリシャ文字が書かれています。
  このようにmvでファイルを移動したら移動先にファイルがあった場合に\e[31m上書き\e[0mされます。"
  read -r
  echo -e "
  mvを使用するさいには\e[31m上書きに気をつけて\e[0mください。"
  read -r
  NEXT_STEP="mv3"
  echo "mv3" > ../save.txt
}

function about_mv3() {
  # Using mv for renaming
  FILE_NAME=$(get_first_file_name "save.txt|any_file.txt")
  if [[ $FILE_NAME == "" ]]; then
    touch "mv3.txt"
    FILE_NAME="mv3.txt"
  fi
  echo -e "
  mvコマンドはファイルやディレクトリーの改名にも使えます。"
  read -r
  echo -e "
  まずは現ディレクトリーの内容を表示してください。"
  read_word "^ls$" "ls" 3
  eval $READ_WORD_RESULT
  echo -e "
  ここにある$FILE_NAMEの名前を適当な名前に変更してみてください。"
  read_word "^mv $FILE_NAME [a-zA-Z0-9]+[a-zA-Z0-9_.]*$" "mv ファイル名 新ファイル名" 3
  eval $READ_WORD_RESULT
  echo -e "
  これで改名できた筈です。
  現ディレクトリーの内容を表示してください。"
  read_word "^ls$" "ls" 3
  eval $READ_WORD_RESULT
  echo -e "
  ファイル名が改名できました。"
  read -r
  NEXT_STEP="cp"
  echo "cp" > ../save.txt
}

function about_cp() {
  # Study cp command
  DIRECTORY_NAME=$(get_first_directory_name "^\.$|^\./(kudamono|yasai)$")
  FILE_NAME=$(get_first_file_name "save.txt|any_file.txt")
  if [[ $DIRECTORY_NAME == "" ]]; then
    mkdir "cp"
    DIRECTORY_NAME="cp"
  fi
  if [[ $FILE_NAME == "" ]]; then
    touch "cp.txt"
    FILE_NAME="cp.txt"
  fi
  echo -e "
  mvコマンドは移動ですが、移動元のファイルは消えます。
  cpコマンドは移動&コピーで、移動元のファイルは残ります。"
  read -r
  echo -e "
  まずは現ディレクトリーの内容を\e[31m詳細\e[0mに表示してください。"
  read_word "^ls -l$" "ls -l" 3
  eval $READ_WORD_RESULT
  echo -e "
  ここにある$DIRECTORY_NAME(ディレクトリー)と$FILE_NAME(ファイル)を使います。
  \e[7mcp\e[0mを使って\e[31m$FILE_NAME\e[0mを\e[31m$DIRECTORY_NAME\e[0m配下に同名で配置してください。"
  read_word "^cp $FILE_NAME $DIRECTORY_NAME/$FILE_NAME$" "cp 移動元 移動先" 3
  eval $READ_WORD_RESULT
  echo -e "
  それでは現ディレクトリーの内容を表示してください。"
  read_word "^ls$" "ls" 3
  eval $READ_WORD_RESULT
  echo -e "
  $FILE_NAMEが\e[31m消えていない\e[0mことが確認できました。"
  read -r
  echo -e "
  今度は\e[31m$DIRECTORY_NAME\e[0mの内容を表示してください。"
  read_word "^ls $DIRECTORY_NAME$" "ls ディレクトリー名" 3
  eval $READ_WORD_RESULT
  echo -e "
  こちらにファイルが移動できているのも確認できました。"
  read -r
  NEXT_STEP="tail"
  echo "tail" > ../save.txt
}

function about_tail() {
  echo -e "
  今nagai.logというファイルを作りました。
  このファイルの内容を表示してください。"
  read_word "^cat nagai.log$" "cat ファイル名" 3
  eval $READ_WORD_RESULT
  echo -e "
  めちゃくちゃ長いですね。
  ログを確認する時には大抵最新の情報が見たいことが多いです。"
  read -r
  echo -e "
  つまり、\e[31m最後の部分のみ\e[0mが表示したいことがほとんどです。
  そういった時に、役立つコマンドがあります。"
  read -r
  echo -e "
  それが\e[7mtail\e[0mコマンドです。
  このコマンドをcatの代わりに使ってみてください。"
  read_word "^tail nagai.log$" "tail ファイル名" 3
  eval $READ_WORD_RESULT
  echo -e "
  最後の\e[31m10行\e[0mが表示されました。
  これで最新の情報のみが確認できます。"
  read -r
  echo -e "
  \e[7m-n\e[0mオブションを付けることで表示行数が指定できます。
  \e[7mtail -n 表示したい行数 ファイル名\e[0mのように打って\e[31m15\e[0m行表示してください。"
  read_word "^tail -n 15 nagai.log$" "tail -n 15 nagai.log" 3
  eval $READ_WORD_RESULT
  echo -e "
  15行表示できています。
  これで最新のログのうち必要な部分のみ抜き出すことができます。"
  read -r
  NEXT_STEP="find"
  echo "find" > ../save.txt
}

function about_find() {
  echo -e "
  ファイル群作成中...\n"
  make_takusan_directories_and_files
  echo -e "
  通常、サーバーには大量のディレクトリーとファイルが存在します。
  その中から見たいファイルを探すのは一苦労です。
  その時に役立つコマンドについて見ていきます。"
  read -r
  echo -e "
  今、\e[31mtakusan\e[0mというディレクトリーを作成しました。
  takusanの中にはたくさんのディレクトリーがあります。
  takusanの内容を\e[31m詳細に\e[0m表示してみてください。"
  read_word "^ls -l takusan$" "ls -l ディレクトリー名" 3
  eval $READ_WORD_RESULT
  echo -e "
  大量の内容物がありますね。
  各行の一番左に\e[31md\e[0mとありますから全部ディレクトリーです。"
  read -r
  echo -e "
  この中から適当なディレクトリーを\e[31m詳細に\e[0m表示してみてください。
  このディレクトリーは\e[31mtakusanの配下\e[mなので気をつけてください。"
  read_word "^ls -l takusan/(angolan_cuisine|anguillian_cuisine|austrian_cuisine|azerbaijani_cuisine|baden_cuisine|barbadian_cuisine|basque_cuisine|bavarian_cuisine|belarusian_cuisine|belgian_cuisine|belizean_cuisine|benin_cuisine|bolivian_cuisine|bosnia_and_herzegovina_cuisine|brazilian_cuisine|bulgarian_cuisine|burmese_cuisine|burundian_cuisine|buryat_cuisine|cameroonian_cuisine|catalan_cuisine|centraafrican_cuisine|chadian_cuisine|chilean_cuisine|colombian_cuisine|comorian_cuisine|congolese_cuisine|czech_cuisine|danish_cuisine|east_timor_cuisine|equatorial_guinea_cuisine|eritrean_cuisine|estonian_cuisine|ethiopian_cuisine|fijian_cuisine|finnish_cuisine|gabonese_cuisine|greek_cuisine|greenlandic_cuisine|guatemalan_cuisine|hawaiian_cuisine|hmong_cuisine|hungarian_cuisine|jamaican_cuisine|kachin_cuisine|kazakh_cuisine|kenyan_cuisine|kyrgyz_cuisine|levantine_cuisine|liechtenstein_cuisine|lithuanian_cuisine|malawian_cuisine|manipuri_cuisine|mariana_islands_cuisine|mauritian_cuisine|mexican_cuisine|mizo_cuisine|monégasque_cuisine|mongolian_cuisine|montserrat_cuisine|nicaraguan_cuisine|panamanian_cuisine|paraguayan_cuisine|romani_cuisine|russian_cuisine|rwandan_cuisine|santomean_cuisine|senegalese_cuisine|seychellois_cuisine|sikkimese_cuisine|slovak_cuisine|slovenian_cuisine|sri_lankan_cuisine|swedish_cuisine|tatar_cuisine|tibetan_cuisine|togolese_cuisine|tongan_cuisine|venezuelan_cuisine)$" "ls -l ディレクトリー名" 3
  eval $READ_WORD_RESULT
  echo -e "
  いくつかファイルが表示されたと思います。"
  read -r
  echo -e "
  もう一度takusanディレクトリーを表示してみてください。
  今度は普通に表示してみてください。"
  read_word "^ls takusan$" "ls ディレクトリー名" 3
  eval $READ_WORD_RESULT
  echo -e "
  今度は別のディレクトリーを普通に表示してみてください。"
  read_word "^ls takusan/(angolan_cuisine|anguillian_cuisine|austrian_cuisine|azerbaijani_cuisine|baden_cuisine|barbadian_cuisine|basque_cuisine|bavarian_cuisine|belarusian_cuisine|belgian_cuisine|belizean_cuisine|benin_cuisine|bolivian_cuisine|bosnia_and_herzegovina_cuisine|brazilian_cuisine|bulgarian_cuisine|burmese_cuisine|burundian_cuisine|buryat_cuisine|cameroonian_cuisine|catalan_cuisine|centraafrican_cuisine|chadian_cuisine|chilean_cuisine|colombian_cuisine|comorian_cuisine|congolese_cuisine|czech_cuisine|danish_cuisine|east_timor_cuisine|equatorial_guinea_cuisine|eritrean_cuisine|estonian_cuisine|ethiopian_cuisine|fijian_cuisine|finnish_cuisine|gabonese_cuisine|greek_cuisine|greenlandic_cuisine|guatemalan_cuisine|hawaiian_cuisine|hmong_cuisine|hungarian_cuisine|jamaican_cuisine|kachin_cuisine|kazakh_cuisine|kenyan_cuisine|kyrgyz_cuisine|levantine_cuisine|liechtenstein_cuisine|lithuanian_cuisine|malawian_cuisine|manipuri_cuisine|mariana_islands_cuisine|mauritian_cuisine|mexican_cuisine|mizo_cuisine|monégasque_cuisine|mongolian_cuisine|montserrat_cuisine|nicaraguan_cuisine|panamanian_cuisine|paraguayan_cuisine|romani_cuisine|russian_cuisine|rwandan_cuisine|santomean_cuisine|senegalese_cuisine|seychellois_cuisine|sikkimese_cuisine|slovak_cuisine|slovenian_cuisine|sri_lankan_cuisine|swedish_cuisine|tatar_cuisine|tibetan_cuisine|togolese_cuisine|tongan_cuisine|venezuelan_cuisine)$" "ls -l ディレクトリー名" 3
  eval $READ_WORD_RESULT
  echo -e "
  多数のファイルがそれぞれのディレクトリーに入っているようです。"
  read -r
  echo -e "
  ここで、例えば\e[31mburrito.txt\e[0mという名前のファイルが見たいとします。"
  read -r
  echo -e "
  普通に一つずつディレクトリーを確認するのはとても大変です。
  こういった場合に使えるのが\e[7mfind ./ -name ファイル名\e[0mです。
  このコマンドを利用して\e[31mburrito.txt\e[0mを探してみてください。"
  read_word "^find ./ -name burrito.txt$" "find ./ -name ファイル名" 3
  eval $READ_WORD_RESULT
  echo -e "
  burrito.txtが存在するディレクトリーが表示されました。"
  read -r
  echo -e "
  今度はファイル名が一部しか分からない場合を想定します。
  この時ファイル名の両隣に*を置きます。\e[7m*ファイル名*\e[0m
  \e[31mjapanese\e[0mという文字を含むファイルを検索してみてください。"
  read_word "^find ./ -name \*japanese\*$" "find ./ -name *ファイル名*" 3
  eval $READ_WORD_RESULT
  echo -e "
  japaneseという文字が含まれるファイルの場所が表示されました。"
  read -r
  echo -e "
  今度は*を抜いて検索してみてください。"
  read_word "^find ./ -name japanese$" "find ./ -name *ファイル名*" 3
  eval $READ_WORD_RESULT
  echo -e "
  何も表示されませんでした。
  *がないと完全一致検索になり、完全なファイル名を入れる必要があります。"
  read -r
  echo -e "
  findコマンドは便利なのでぜひ覚えて使いこなしてください。"
  read -r
  NEXT_STEP="end"
  echo "end" > ../save.txt
}

function finalize() {
  echo -e "
  最後に、今まで見てきたコマンド一覧です。
  ls
  ls -l
  cd ディレクトリー名
  pwd
  mkdir 新ディレクトリー名
  touch 新ファイル名
  rmdir ディレクトリー名
  rm ファイル名
  rm -r ディレクトリー名
  cat ファイル名
  mv 移動元パス 移動先パス
  cp 複製元パス 複製先パス
  tail ファイル名
  tail -n 数値 ファイル名
  find ./ -name ファイル名"
  read -r
  echo -e "
  他にもコマンドはありますが、基礎編では以上とします。"
  read -r
  echo -e "
  お疲れ様でした。"
  read -r
  echo "introduction" > ../save.txt
  exit
}

function read_word() {
  if [ -z "$1" ]; then
    echo "Usage: my_function <arg1>"
    return 1
  fi
  LOOP=1
  while true; do
    read -r -p "$ " USER_INPUT
    if [[ "$USER_INPUT" =~ $1 ]]; then
      READ_WORD_RESULT=$USER_INPUT
      return
    fi
    if [[ -n $2 ]] && [[ -n $3 ]] && [[ $LOOP -gt $[$3 - 1] ]]; then
      echo $2
    fi
    LOOP=$[$LOOP + 1]
  done
}

function make_sure_tutorial_exists() {
  # --[tutorial] <- makes sure this exists
  if [ ! -d "tutorial" ]; then
    mkdir tutorial
  fi
}

function make_sure_any_directory_exists() {
  DIR_COUNT=$(find . -maxdepth 1 -type d | wc -l)
  DIR_COUNT=$((DIR_COUNT - 1))
  if [ "$DIR_COUNT" -eq 0 ]; then
    mkdir test
  fi
}

function make_sure_any_file_exists() {
  FILE_COUNT=$(find . -maxdepth 1 -type f | wc -l)
  if [ "$FILE_COUNT" -eq 0 ]; then
    touch testfile.txt
  fi
}

function get_first_empty_directory_name() {
  find . -maxdepth 1 -type d ! -name '.' | while read -r dir; do
    if [ -z "$(ls -A "$dir")" ]; then
      echo "$dir"
      return
    fi
  done
}

function get_first_directory_name() {
  if [ -z "$1" ]; then
    find . -maxdepth 1 -type d | sort | head -n 1 | sed 's|^\./||'
  else
    find . -maxdepth 1 -type d | grep -v -E "$1" | sort | head -n 1 | sed 's|^\./||'
  fi
}

function get_first_file_name() {
  if [ -z "$1" ]; then
    find . -maxdepth 1 -type f | sort | head -n 1 | sed 's|^\./||'
  else
    find . -maxdepth 1 -type f | grep -v -E "$1" | sort | head -n 1 | sed 's|^\./||'
  fi
}

function make_directory_if_not_exists() {
  if [ ! -d "$1" ]; then
    mkdir "$1"
  fi
}

function touch_file_if_not_exists() {
  if [ ! -f "$1" ]; then
    touch "$1"
    if [ -n "$2" ]; then
      echo "$2" > "$1"
    fi
  fi
}

function make_sure_yasai_and_kudamon_exist() {
  make_directory_if_not_exists "yasai"
  if [[ ! (-z "$1") ]] && [[ "$1" == "ringo in kudamono" ]]; then
    RINGO="kudamono"
  else
    RINGO="yasai"
  fi
  make_directory_if_not_exists "$RINGO/ringo"
  touch_file_if_not_exists "$RINGO/ringo/fuji.txt" "汁気が多い"
  touch_file_if_not_exists "$RINGO/ringo/mutsu.txt" "香り高い高級品種"
  touch_file_if_not_exists "$RINGO/ringo/jonagoorudo.txt" "さわやかな酸味"
  make_directory_if_not_exists "yasai/kyuuri"
  touch_file_if_not_exists "yasai/kyuuri/shiroibo.txt" "いつもの"
  touch_file_if_not_exists "yasai/kyuuri/kagabuto.txt" "SUGOI DEKAI"
  make_directory_if_not_exists "yasai/tomato"
  touch_file_if_not_exists "yasai/tomato/oodama.txt" "普通のトマト"
  touch_file_if_not_exists "yasai/tomato/puchitomato.txt" "ミニトマト参照"
  touch_file_if_not_exists "yasai/tomato/minitomato.txt" "プチトマト参照"
  make_directory_if_not_exists "yasai/kinoko"
  touch_file_if_not_exists "yasai/kinoko/matsutake.txt" "香り高い"
  touch_file_if_not_exists "yasai/kinoko/shiikate.txt" "昔は高級だった"
  touch_file_if_not_exists "yasai/kinoko/eringi.txt" "肉厚"
  make_directory_if_not_exists "kudamono"
  make_directory_if_not_exists "kudamono/mikan"
  touch_file_if_not_exists "kudamono/mikan/buntan.txt" "大きくてシャキシャキ"
  touch_file_if_not_exists "kudamono/mikan/ponkan.txt" "甘味と酸味"
  touch_file_if_not_exists "kudamono/mikan/setoka.txt" "すごく甘い"
  make_directory_if_not_exists "kudamono/ichigo"
  touch_file_if_not_exists "kudamono/ichigo/benihoppe.txt" "たくさん作られてる"
  touch_file_if_not_exists "kudamono/ichigo/amaou.txt" "甘い"
  touch_file_if_not_exists "kudamono/ichigo/tochiotome.txt" "酸味が強い"
  make_directory_if_not_exists "kudamono/meron"
  touch_file_if_not_exists "kudamono/meron/andesu.txt" "安全です"
  touch_file_if_not_exists "kudamono/meron/yuubari.txt" "財政破綻"
  touch_file_if_not_exists "kudamono/meron/kuraun.txt" "最高にうまい"
  make_directory_if_not_exists "kudamono/suica"
  touch_file_if_not_exists "kudamono/suica/suica.txt" "全国的"
  touch_file_if_not_exists "kudamono/suica/pasmo.txt" "首都圏"
  touch_file_if_not_exists "kudamono/suica/kitaca.txt" "北海道"
  touch_file_if_not_exists "kudamono/suica/toica.txt" "東海"
  touch_file_if_not_exists "kudamono/suica/icoca.txt" "西日本"
  touch_file_if_not_exists "kudamono/suica/pitapa.txt" "関西"
  touch_file_if_not_exists "kudamono/suica/manaca.txt" "名古屋"
  touch_file_if_not_exists "kudamono/suica/sugoca.txt" "九州"
}

function make_nagai_log_file() {
  echo -e "2024-07-25 10:00:01,123 INFO Starting the application...
2024-07-25 10:00:02,456 DEBUG Initializing database connection...
2024-07-25 10:00:03,789 INFO Database connection established
2024-07-25 10:00:04,012 INFO User 'admin' logged in
2024-07-25 10:00:05,345 WARNING Low disk space on /dev/sda1
2024-07-25 10:00:06,678 ERROR Failed to load configuration file: config.yml
Traceback (most recent call last):
  File 'app.py', line 42, in <module>
    config = load_config('config.yml')
  File 'app.py', line 12, in load_config
    with open(config_file, 'r') as file:
FileNotFoundError: [Errno 2] No such file or directory: 'config.yml'
2024-07-25 10:00:07,901 INFO Retrying to load configuration...
2024-07-25 10:00:08,234 INFO Configuration loaded successfully
2024-07-25 10:00:09,567 INFO Starting background job: JobId=1234
2024-07-25 10:00:10,890 DEBUG JobId=1234 - Step 1 completed
2024-07-25 10:00:11,123 DEBUG JobId=1234 - Step 2 completed
2024-07-25 10:00:12,456 INFO JobId=1234 completed successfully
2024-07-25 10:00:13,789 ERROR Unexpected error occurred
Traceback (most recent call last):
  File 'job.py', line 57, in run
    result = perform_task()
  File 'job.py', line 23, in perform_task
    raise ValueError('Invalid input data')
ValueError: Invalid input data
2024-07-25 10:00:14,012 INFO Shutting down the application...
2024-07-25 10:00:15,345 INFO Application shutdown complete

2024-07-25 10:10:01,123 INFO Starting the application...
2024-07-25 10:10:02,456 DEBUG Checking system health...
2024-07-25 10:10:03,789 INFO System health is good
2024-07-25 10:10:04,012 INFO User 'guest' logged in
2024-07-25 10:10:05,345 WARNING High memory usage detected
2024-07-25 10:10:06,678 ERROR Failed to connect to external service: ServiceTimeout
Traceback (most recent call last):
  File 'service_connector.py', line 89, in connect
    response = external_service.connect()
  File 'external_service.py', line 23, in connect
    raise TimeoutError('Connection timed out')
TimeoutError: Connection timed out
2024-07-25 10:10:07,901 INFO Retrying connection to external service...
2024-07-25 10:10:08,234 INFO Connection to external service established
2024-07-25 10:10:09,567 INFO Fetching data from external service: JobId=5678
2024-07-25 10:10:10,890 DEBUG JobId=5678 - Data fetch step 1 completed
2024-07-25 10:10:11,123 DEBUG JobId=5678 - Data fetch step 2 completed
2024-07-25 10:10:12,456 INFO JobId=5678 data fetch completed successfully
2024-07-25 10:10:13,789 ERROR Data processing error
Traceback (most recent call last):
  File 'data_processor.py', line 72, in process
    processed_data = process_data(raw_data)
  File 'data_processor.py', line 45, in process_data
    raise KeyError('Missing required field')
KeyError: Missing required field
2024-07-25 10:10:14,012 INFO Cleaning up resources...
2024-07-25 10:10:15,345 INFO Resource cleanup complete
2024-07-25 10:10:16,678 INFO Shutting down the application...
2024-07-25 10:10:17,901 INFO Application shutdown complete

2024-07-25 10:20:01,123 INFO Starting the application...
2024-07-25 10:20:02,456 DEBUG Initializing cache...
2024-07-25 10:20:03,789 INFO Cache initialization completed
2024-07-25 10:20:04,012 INFO User 'john_doe' logged in
2024-07-25 10:20:05,345 WARNING CPU temperature high
2024-07-25 10:20:06,678 ERROR Database query failed: QueryTimeout
Traceback (most recent call last):
  File 'database.py', line 132, in query
    result = execute_query(query_string)
  File 'database.py', line 65, in execute_query
    raise TimeoutError('Query timed out')
TimeoutError: Query timed out
2024-07-25 10:20:07,901 INFO Retrying database query...
2024-07-25 10:20:08,234 INFO Database query successful
2024-07-25 10:20:09,567 INFO Starting data export: JobId=9101
2024-07-25 10:20:10,890 DEBUG JobId=9101 - Export step 1 completed
2024-07-25 10:20:11,123 DEBUG JobId=9101 - Export step 2 completed
2024-07-25 10:20:12,456 INFO JobId=9101 data export completed successfully
2024-07-25 10:20:13,789 ERROR Export file write error
Traceback (most recent call last):
  File 'exporter.py', line 47, in write_file
    with open(export_path, 'w') as file:
PermissionError: [Errno 13] Permission denied: '/path/to/export/file.csv'
2024-07-25 10:20:14,012 INFO Shutting down the application...
2024-07-25 10:20:15,345 INFO Application shutdown complete" > "nagai.log"
}

function make_takusan_directories_and_files() {
  make_directory_if_not_exists takusan
  make_directory_if_not_exists takusan/angolan_cuisine
  touch_file_if_not_exists takusan/angolan_cuisine/arroz.txt
  touch_file_if_not_exists takusan/angolan_cuisine/cabidela.txt
  touch_file_if_not_exists takusan/angolan_cuisine/caldeirada_de_cabrito.txt
  touch_file_if_not_exists takusan/angolan_cuisine/fish_stews.txt
  touch_file_if_not_exists takusan/angolan_cuisine/calulu.csv
  touch_file_if_not_exists takusan/angolan_cuisine/caruru.txt
  touch_file_if_not_exists takusan/angolan_cuisine/catatos.txt
  touch_file_if_not_exists takusan/angolan_cuisine/chikuanga.txt
  touch_file_if_not_exists takusan/angolan_cuisine/doce_de_ginguba.txt
  touch_file_if_not_exists takusan/angolan_cuisine/farofa.txt
  touch_file_if_not_exists takusan/angolan_cuisine/feijão_de_óleo_de_palma.txt
  touch_file_if_not_exists takusan/angolan_cuisine/frango_piri-piri.txt
  touch_file_if_not_exists takusan/angolan_cuisine/gafanhotos_de_palmeira.txt
  touch_file_if_not_exists takusan/angolan_cuisine/gindungo.txt
  touch_file_if_not_exists takusan/angolan_cuisine/jinguinga.txt
  touch_file_if_not_exists takusan/angolan_cuisine/kifula.txt
  touch_file_if_not_exists takusan/angolan_cuisine/kissuto_rombo.txt
  touch_file_if_not_exists takusan/angolan_cuisine/kitaba.txt
  touch_file_if_not_exists takusan/angolan_cuisine/kitetas.txt
  touch_file_if_not_exists takusan/angolan_cuisine/kizaka.txt
  touch_file_if_not_exists takusan/angolan_cuisine/leite_azedo_com_pirão_de_milho.txt
  touch_file_if_not_exists takusan/angolan_cuisine/mafuma.txt
  touch_file_if_not_exists takusan/angolan_cuisine/mariscos_cozidos_com_gindungo.txt
  touch_file_if_not_exists takusan/angolan_cuisine/mousse_de_maracujá.txt
  touch_file_if_not_exists takusan/angolan_cuisine/mufete_de_kacusso.txt
  touch_file_if_not_exists takusan/angolan_cuisine/mukua.txt
  touch_file_if_not_exists takusan/angolan_cuisine/molho_cru.txt
  touch_file_if_not_exists takusan/angolan_cuisine/ngonguenha.txt
  touch_file_if_not_exists takusan/angolan_cuisine/papaya.txt
  touch_file_if_not_exists takusan/angolan_cuisine/pavê_de_ginguba.txt
  touch_file_if_not_exists takusan/angolan_cuisine/pé-de-moleque.txt
  touch_file_if_not_exists takusan/angolan_cuisine/quiabos_com_camarão.txt
  touch_file_if_not_exists takusan/angolan_cuisine/tarco.txt
  make_directory_if_not_exists takusan/cameroonian_cuisine
  touch_file_if_not_exists takusan/cameroonian_cuisine/fufu_corn_and_njama_njama.txt
  touch_file_if_not_exists takusan/cameroonian_cuisine/brochettes.txt
  touch_file_if_not_exists takusan/cameroonian_cuisine/sangah.txt
  touch_file_if_not_exists takusan/cameroonian_cuisine/mbanga_soup_and_kwacoco.txt
  touch_file_if_not_exists takusan/cameroonian_cuisine/eru_or_nfoh_and_water_fufu.txt
  touch_file_if_not_exists takusan/cameroonian_cuisine/ndolé.txt
  touch_file_if_not_exists takusan/cameroonian_cuisine/koki.txt
  touch_file_if_not_exists takusan/cameroonian_cuisine/achu_soup.txt
  touch_file_if_not_exists takusan/cameroonian_cuisine/mbongo_\'o_tjobi.csv
  touch_file_if_not_exists takusan/cameroonian_cuisine/egusi_soup.txt
  touch_file_if_not_exists takusan/cameroonian_cuisine/kondreh.txt
  touch_file_if_not_exists takusan/cameroonian_cuisine/kati_kati.txt
  make_directory_if_not_exists takusan/chadian_cuisine
  touch_file_if_not_exists takusan/chadian_cuisine/daraba.txt
  touch_file_if_not_exists takusan/chadian_cuisine/dried_fish.txt
  touch_file_if_not_exists takusan/chadian_cuisine/grilled_meats.txt
  touch_file_if_not_exists takusan/chadian_cuisine/boule.txt
  touch_file_if_not_exists takusan/chadian_cuisine/la_bouillie.txt
  make_directory_if_not_exists takusan/congolese_cuisine
  touch_file_if_not_exists takusan/congolese_cuisine/moamba.txt
  touch_file_if_not_exists takusan/congolese_cuisine/ngai_ngai_ya_musaka.txt
  touch_file_if_not_exists takusan/congolese_cuisine/chikwangue.txt
  touch_file_if_not_exists takusan/congolese_cuisine/fufu.txt
  touch_file_if_not_exists takusan/congolese_cuisine/loso_na_madesu.txt
  touch_file_if_not_exists takusan/congolese_cuisine/sombe.txt
  touch_file_if_not_exists takusan/congolese_cuisine/ndakala.txt
  touch_file_if_not_exists takusan/congolese_cuisine/pili_pili.txt
  touch_file_if_not_exists takusan/congolese_cuisine/mbembe.txt
  touch_file_if_not_exists takusan/congolese_cuisine/mulenda.txt
  touch_file_if_not_exists takusan/congolese_cuisine/soso.txt
  touch_file_if_not_exists takusan/congolese_cuisine/ntaba.txt
  touch_file_if_not_exists takusan/congolese_cuisine/mbisi_ya_mayi.txt
  touch_file_if_not_exists takusan/congolese_cuisine/liboke.txt
  touch_file_if_not_exists takusan/congolese_cuisine/mikate.txt
  touch_file_if_not_exists takusan/congolese_cuisine/makelele.txt
  touch_file_if_not_exists takusan/congolese_cuisine/pain_mwambe.txt
  touch_file_if_not_exists takusan/congolese_cuisine/makayabu.txt
  touch_file_if_not_exists takusan/congolese_cuisine/kamundele.txt
  touch_file_if_not_exists takusan/congolese_cuisine/thomson.txt
  touch_file_if_not_exists takusan/congolese_cuisine/mbewngi.txt
  touch_file_if_not_exists takusan/congolese_cuisine/loso_ya_bulayi.txt
  touch_file_if_not_exists takusan/congolese_cuisine/madesu.txt
  touch_file_if_not_exists takusan/congolese_cuisine/pondu_ya_madesu.txt
  touch_file_if_not_exists takusan/congolese_cuisine/dabo_kolo.txt
  make_directory_if_not_exists takusan/centraafrican_cuisine
  touch_file_if_not_exists takusan/centraafrican_cuisine/bushmeat.txt
  touch_file_if_not_exists takusan/centraafrican_cuisine/cassava_and_cassava_greens.txt
  touch_file_if_not_exists takusan/centraafrican_cuisine/checkin_and_cumin_stew.txt
  touch_file_if_not_exists takusan/centraafrican_cuisine/chichinga.txt
  touch_file_if_not_exists takusan/centraafrican_cuisine/egusi_sauce.txt
  touch_file_if_not_exists takusan/centraafrican_cuisine/foutou.txt
  touch_file_if_not_exists takusan/centraafrican_cuisine/fufu.txt
  touch_file_if_not_exists takusan/centraafrican_cuisine/fulani_boullie.txt
  touch_file_if_not_exists takusan/centraafrican_cuisine/gozo.txt
  touch_file_if_not_exists takusan/centraafrican_cuisine/kanda_ti_nyma.txt
  touch_file_if_not_exists takusan/centraafrican_cuisine/muamba.txt
  touch_file_if_not_exists takusan/centraafrican_cuisine/palm_butter_soup.txt
  touch_file_if_not_exists takusan/centraafrican_cuisine/spinach_stew.txt
  touch_file_if_not_exists takusan/centraafrican_cuisine/shrimp_with_boiled_sweet_potato_yam.txt
  touch_file_if_not_exists takusan/centraafrican_cuisine/yam.txt
  make_directory_if_not_exists takusan/equatorial_guinea_cuisine
  touch_file_if_not_exists takusan/equatorial_guinea_cuisine/peppersoup.txt
  touch_file_if_not_exists takusan/equatorial_guinea_cuisine/sopa_de_pescado_con_cacahuete.txt
  touch_file_if_not_exists takusan/equatorial_guinea_cuisine/bambucha.txt
  touch_file_if_not_exists takusan/equatorial_guinea_cuisine/chicken_in_peanut_sauce.txt
  touch_file_if_not_exists takusan/equatorial_guinea_cuisine/modica_in_a_block.txt
  touch_file_if_not_exists takusan/equatorial_guinea_cuisine/salted_fish.txt
  touch_file_if_not_exists takusan/equatorial_guinea_cuisine/chicken_with_moambe_sauce.txt
  touch_file_if_not_exists takusan/equatorial_guinea_cuisine/succotash.txt
  touch_file_if_not_exists takusan/equatorial_guinea_cuisine/plantain_peppersoup.txt
  touch_file_if_not_exists takusan/equatorial_guinea_cuisine/paella.csv
  make_directory_if_not_exists takusan/gabonese_cuisine
  touch_file_if_not_exists takusan/gabonese_cuisine/atanga.txt
  touch_file_if_not_exists takusan/gabonese_cuisine/beignets.txt
  touch_file_if_not_exists takusan/gabonese_cuisine/brochettes.txt
  touch_file_if_not_exists takusan/gabonese_cuisine/dried_meats.txt
  touch_file_if_not_exists takusan/gabonese_cuisine/fufu.txt
  touch_file_if_not_exists takusan/gabonese_cuisine/nyembwe.txt
  touch_file_if_not_exists takusan/gabonese_cuisine/musterd_chicken.txt
  touch_file_if_not_exists takusan/gabonese_cuisine/meat_stews.txt
  touch_file_if_not_exists takusan/gabonese_cuisine/smoked_fish.txt
  touch_file_if_not_exists takusan/gabonese_cuisine/baked_bananas_coated_with_bread_crumbs_and_served_with_sour_cream_and_brown_suga.txt
  touch_file_if_not_exists takusan/gabonese_cuisine/gari.txt
  touch_file_if_not_exists takusan/gabonese_cuisine/plantains.txt
  make_directory_if_not_exists takusan/santomean_cuisine
  touch_file_if_not_exists takusan/santomean_cuisine/arroz_doce.txt
  touch_file_if_not_exists takusan/santomean_cuisine/banana_pap.txt
  touch_file_if_not_exists takusan/santomean_cuisine/barriga_de_peixe.txt
  touch_file_if_not_exists takusan/santomean_cuisine/blablá.txt
  touch_file_if_not_exists takusan/santomean_cuisine/broa.txt
  touch_file_if_not_exists takusan/santomean_cuisine/cachupa.txt
  touch_file_if_not_exists takusan/santomean_cuisine/calulu.txt
  touch_file_if_not_exists takusan/santomean_cuisine/chicken_with_coffee_sauce.txt
  touch_file_if_not_exists takusan/santomean_cuisine/djogo.txt
  touch_file_if_not_exists takusan/santomean_cuisine/omelettes.txt
  touch_file_if_not_exists takusan/santomean_cuisine/boiled_pork.txt
  make_directory_if_not_exists takusan/burundian_cuisine
  touch_file_if_not_exists takusan/burundian_cuisine/ugali.txt
  touch_file_if_not_exists takusan/burundian_cuisine/curry.txt
  touch_file_if_not_exists takusan/burundian_cuisine/maharagwe.txt
  touch_file_if_not_exists takusan/burundian_cuisine/ibiharage.txt
  touch_file_if_not_exists takusan/burundian_cuisine/beans_and_bananas.txt
  touch_file_if_not_exists takusan/burundian_cuisine/bean_soup.txt
  touch_file_if_not_exists takusan/burundian_cuisine/matura_and_mahu.txt
  touch_file_if_not_exists takusan/burundian_cuisine/boko_boko_harees.txt
  make_directory_if_not_exists takusan/comorian_cuisine
  make_directory_if_not_exists takusan/eritrean_cuisine
  touch_file_if_not_exists takusan/eritrean_cuisine/kitcha_fit-fit.txt
  touch_file_if_not_exists takusan/eritrean_cuisine/fit-fit.txt
  touch_file_if_not_exists takusan/eritrean_cuisine/akelet.txt
  touch_file_if_not_exists takusan/eritrean_cuisine/shahan_ful.txt
  touch_file_if_not_exists takusan/eritrean_cuisine/panettone.txt
  touch_file_if_not_exists takusan/eritrean_cuisine/tsebhi.txt
  touch_file_if_not_exists takusan/eritrean_cuisine/dorho.txt
  touch_file_if_not_exists takusan/eritrean_cuisine/qulwa.txt
  touch_file_if_not_exists takusan/eritrean_cuisine/alicha.txt
  touch_file_if_not_exists takusan/eritrean_cuisine/tihlo.txt
  touch_file_if_not_exists takusan/eritrean_cuisine/hilbet.txt
  touch_file_if_not_exists takusan/eritrean_cuisine/shiro.txt
  touch_file_if_not_exists takusan/eritrean_cuisine/birsen.csv
  touch_file_if_not_exists takusan/eritrean_cuisine/hamli.csv
  make_directory_if_not_exists takusan/ethiopian_cuisine
  touch_file_if_not_exists takusan/ethiopian_cuisine/dabo_kolo.txt
  touch_file_if_not_exists takusan/ethiopian_cuisine/injera.txt
  touch_file_if_not_exists takusan/ethiopian_cuisine/himbasha.txt
  touch_file_if_not_exists takusan/ethiopian_cuisine/samosa.txt
  touch_file_if_not_exists takusan/ethiopian_cuisine/fir-fir.txt
  touch_file_if_not_exists takusan/ethiopian_cuisine/ga\'at.txt
  touch_file_if_not_exists takusan/ethiopian_cuisine/ful_medames.txt
  touch_file_if_not_exists takusan/ethiopian_cuisine/gored_gored.txt
  touch_file_if_not_exists takusan/ethiopian_cuisine/kitfo.txt
  touch_file_if_not_exists takusan/ethiopian_cuisine/shahan_ful.txt
  touch_file_if_not_exists takusan/ethiopian_cuisine/shiro.txt
  touch_file_if_not_exists takusan/ethiopian_cuisine/tibs.txt
  touch_file_if_not_exists takusan/ethiopian_cuisine/tihlo.txt
  touch_file_if_not_exists takusan/ethiopian_cuisine/wat.txt
  touch_file_if_not_exists takusan/ethiopian_cuisine/enset.txt
  touch_file_if_not_exists takusan/ethiopian_cuisine/teff.txt
  touch_file_if_not_exists takusan/ethiopian_cuisine/gesho.txt
  touch_file_if_not_exists takusan/ethiopian_cuisine/niger_seed.txt
  touch_file_if_not_exists takusan/ethiopian_cuisine/berbere.txt
  touch_file_if_not_exists takusan/ethiopian_cuisine/mitmita.txt
  touch_file_if_not_exists takusan/ethiopian_cuisine/niter_kibbeh.txt
  touch_file_if_not_exists takusan/ethiopian_cuisine/tella.txt
  touch_file_if_not_exists takusan/ethiopian_cuisine/tej.txt
  make_directory_if_not_exists takusan/kenyan_cuisine
  touch_file_if_not_exists takusan/kenyan_cuisine/sukuma_wiki.txt
  touch_file_if_not_exists takusan/kenyan_cuisine/nyama_choma.txt
  touch_file_if_not_exists takusan/kenyan_cuisine/ingokho_with_ugali.txt
  make_directory_if_not_exists takusan/malawian_cuisine
  touch_file_if_not_exists takusan/malawian_cuisine/nsima.txt
  touch_file_if_not_exists takusan/malawian_cuisine/kachumbari.txt
  touch_file_if_not_exists takusan/malawian_cuisine/thobwa.txt
  touch_file_if_not_exists takusan/malawian_cuisine/kondowole.txt
  touch_file_if_not_exists takusan/malawian_cuisine/futali.txt
  touch_file_if_not_exists takusan/malawian_cuisine/nthochi.txt
  make_directory_if_not_exists takusan/mauritian_cuisine
  touch_file_if_not_exists takusan/mauritian_cuisine/diri_frir.txt
  touch_file_if_not_exists takusan/mauritian_cuisine/halim.csv
  touch_file_if_not_exists takusan/mauritian_cuisine/biryani.txt
  touch_file_if_not_exists takusan/mauritian_cuisine/dholl_puri.txt
  touch_file_if_not_exists takusan/mauritian_cuisine/vinnday.txt
  touch_file_if_not_exists takusan/mauritian_cuisine/gato_brinzel.txt
  touch_file_if_not_exists takusan/mauritian_cuisine/gateau_patates.txt
  touch_file_if_not_exists takusan/mauritian_cuisine/gato_piment.txt
  touch_file_if_not_exists takusan/mauritian_cuisine/merveilles.txt
  touch_file_if_not_exists takusan/mauritian_cuisine/samosa.txt
  make_directory_if_not_exists takusan/rwandan_cuisine
  touch_file_if_not_exists takusan/rwandan_cuisine/matoke.txt
  touch_file_if_not_exists takusan/rwandan_cuisine/ibihaza.txt
  touch_file_if_not_exists takusan/rwandan_cuisine/ikinyiga.txt
  touch_file_if_not_exists takusan/rwandan_cuisine/umutsima_w\’uburo.txt
  make_directory_if_not_exists takusan/seychellois_cuisine
  touch_file_if_not_exists takusan/seychellois_cuisine/bouyon_bred.txt
  touch_file_if_not_exists takusan/seychellois_cuisine/bourzwa_griye.txt
  touch_file_if_not_exists takusan/seychellois_cuisine/kari_bernik.txt
  touch_file_if_not_exists takusan/seychellois_cuisine/kasava_pudding.txt
  touch_file_if_not_exists takusan/seychellois_cuisine/satini_reken.txt
  touch_file_if_not_exists takusan/seychellois_cuisine/coconut_curry.txt
  touch_file_if_not_exists takusan/seychellois_cuisine/kat-kat_banane.txt
  touch_file_if_not_exists takusan/seychellois_cuisine/salad_palmis.txt
  make_directory_if_not_exists takusan/benin_cuisine
  touch_file_if_not_exists takusan/benin_cuisine/Àkàrà.txt
  touch_file_if_not_exists takusan/benin_cuisine/akassa.txt
  touch_file_if_not_exists takusan/benin_cuisine/akpan.txt
  touch_file_if_not_exists takusan/benin_cuisine/aloko.txt
  touch_file_if_not_exists takusan/benin_cuisine/amiwo.txt
  touch_file_if_not_exists takusan/benin_cuisine/beignets.txt
  touch_file_if_not_exists takusan/benin_cuisine/fufu.txt
  touch_file_if_not_exists takusan/benin_cuisine/garri.txt
  touch_file_if_not_exists takusan/benin_cuisine/moyo.txt
  touch_file_if_not_exists takusan/benin_cuisine/igname_pilée.txt
  make_directory_if_not_exists takusan/senegalese_cuisine
  touch_file_if_not_exists takusan/senegalese_cuisine/ndambé.txt
  touch_file_if_not_exists takusan/senegalese_cuisine/bread_and_café_touba.txt
  touch_file_if_not_exists takusan/senegalese_cuisine/thieboudienne.txt
  touch_file_if_not_exists takusan/senegalese_cuisine/thiébou.txt
  touch_file_if_not_exists takusan/senegalese_cuisine/thiébou_guinar.txt
  touch_file_if_not_exists takusan/senegalese_cuisine/thiébou_guerté.txt
  touch_file_if_not_exists takusan/senegalese_cuisine/yassa.txt
  touch_file_if_not_exists takusan/senegalese_cuisine/chere.txt
  touch_file_if_not_exists takusan/senegalese_cuisine/maafe.txt
  touch_file_if_not_exists takusan/senegalese_cuisine/tchou.txt
  touch_file_if_not_exists takusan/senegalese_cuisine/bassi-salté.txt
  touch_file_if_not_exists takusan/senegalese_cuisine/sombi.txt
  touch_file_if_not_exists takusan/senegalese_cuisine/capitaine_à_la_saint-louisienne.txt
  touch_file_if_not_exists takusan/senegalese_cuisine/caldou.txt
  touch_file_if_not_exists takusan/senegalese_cuisine/fattaya.txt
  touch_file_if_not_exists takusan/senegalese_cuisine/dibi.txt
  make_directory_if_not_exists takusan/togolese_cuisine
  touch_file_if_not_exists takusan/togolese_cuisine/agouti.txt
  touch_file_if_not_exists takusan/togolese_cuisine/akpan.txt
  touch_file_if_not_exists takusan/togolese_cuisine/fufu.txt
  touch_file_if_not_exists takusan/togolese_cuisine/koklo_meme.txt
  touch_file_if_not_exists takusan/togolese_cuisine/kokonte.txt
  touch_file_if_not_exists takusan/togolese_cuisine/pâté.txt
  touch_file_if_not_exists takusan/togolese_cuisine/riz_sauce_d\’arachide.txt
  touch_file_if_not_exists takusan/togolese_cuisine/akume.txt
  make_directory_if_not_exists takusan/greenlandic_cuisine
  touch_file_if_not_exists takusan/greenlandic_cuisine/suaasat.txt
  make_directory_if_not_exists takusan/mexican_cuisine
  touch_file_if_not_exists takusan/mexican_cuisine/aguachile.txt
  touch_file_if_not_exists takusan/mexican_cuisine/bolillos.txt
  touch_file_if_not_exists takusan/mexican_cuisine/burrito.txt
  touch_file_if_not_exists takusan/mexican_cuisine/mole_de_olla.txt
  touch_file_if_not_exists takusan/mexican_cuisine/mixiotes.txt
  touch_file_if_not_exists takusan/mexican_cuisine/memela.txt
  touch_file_if_not_exists takusan/mexican_cuisine/menudo.txt
  touch_file_if_not_exists takusan/mexican_cuisine/machaca.txt
  touch_file_if_not_exists takusan/mexican_cuisine/chorizo.txt
  touch_file_if_not_exists takusan/mexican_cuisine/elote.txt
  touch_file_if_not_exists takusan/mexican_cuisine/japanese_peanuts.txt
  touch_file_if_not_exists takusan/mexican_cuisine/tlayudas.txt
  touch_file_if_not_exists takusan/mexican_cuisine/tortillas.txt
  touch_file_if_not_exists takusan/mexican_cuisine/totopo.txt
  make_directory_if_not_exists takusan/belizean_cuisine
  touch_file_if_not_exists takusan/belizean_cuisine/ceviche.txt
  touch_file_if_not_exists takusan/belizean_cuisine/fry_jack.txt
  touch_file_if_not_exists takusan/belizean_cuisine/johnnycake.txt
  touch_file_if_not_exists takusan/belizean_cuisine/conch_fritter.txt
  touch_file_if_not_exists takusan/belizean_cuisine/dukunu.csv
  touch_file_if_not_exists takusan/belizean_cuisine/hudut.txt
  touch_file_if_not_exists takusan/belizean_cuisine/bile_up.txt
  touch_file_if_not_exists takusan/belizean_cuisine/tamales.txt
  touch_file_if_not_exists takusan/belizean_cuisine/curry_chicken.txt
  touch_file_if_not_exists takusan/belizean_cuisine/rice_and_beans.txt
  touch_file_if_not_exists takusan/belizean_cuisine/garnaches.txt
  touch_file_if_not_exists takusan/belizean_cuisine/panades.txt
  touch_file_if_not_exists takusan/belizean_cuisine/salbutes.txt
  touch_file_if_not_exists takusan/belizean_cuisine/burritos.txt
  touch_file_if_not_exists takusan/belizean_cuisine/brown_stew_chicken.txt
  touch_file_if_not_exists takusan/belizean_cuisine/brown_stew_beaf.txt
  touch_file_if_not_exists takusan/belizean_cuisine/caldo.txt
  touch_file_if_not_exists takusan/belizean_cuisine/escoveitch_fish.txt
  touch_file_if_not_exists takusan/belizean_cuisine/conch_soup.txt
  touch_file_if_not_exists takusan/belizean_cuisine/callaloo_and_saltfish.txt
  touch_file_if_not_exists takusan/belizean_cuisine/cabbage_and_saltfish.txt
  touch_file_if_not_exists takusan/belizean_cuisine/steamed_fish.txt
  touch_file_if_not_exists takusan/belizean_cuisine/cowfoot.txt
  touch_file_if_not_exists takusan/belizean_cuisine/caan_sham.csv
  touch_file_if_not_exists takusan/belizean_cuisine/stretch_me_guts.txt
  touch_file_if_not_exists takusan/belizean_cuisine/tacos.txt
  touch_file_if_not_exists takusan/belizean_cuisine/jerk_chicken.txt
  touch_file_if_not_exists takusan/belizean_cuisine/kebab.txt
  touch_file_if_not_exists takusan/belizean_cuisine/coconut_rice.txt
  make_directory_if_not_exists takusan/guatemalan_cuisine
  touch_file_if_not_exists takusan/guatemalan_cuisine/tapado.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/chiles_rellenos.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/gallo_en_perro.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/gallo_en_chicha.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/garnaches.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/pepián.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/subanik.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/kak\'ik.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/caldo_de_res_or_cocido.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/caldo_de_gallina.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/jocón.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/hilachas.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/güicoyitos_rellenos.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/pollo_a_la_cerveza.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/pollo_guisado.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/carne_guisada.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/chuletas_fascinante.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/ensalada_en_escabeche.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/pollo_encebollado.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/estofado.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/revolcado.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/pollo_en_crema.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/carne_adobada.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/pulique.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/suban-ik.txt
  touch_file_if_not_exists takusan/guatemalan_cuisine/enchiladas.csv
  make_directory_if_not_exists takusan/nicaraguan_cuisine
  touch_file_if_not_exists takusan/nicaraguan_cuisine/arroz_con_pollo.txt
  touch_file_if_not_exists takusan/nicaraguan_cuisine/camarones_al_ajillo.txt
  touch_file_if_not_exists takusan/nicaraguan_cuisine/carne_asada.txt
  touch_file_if_not_exists takusan/nicaraguan_cuisine/carne_desmenuzada.txt
  touch_file_if_not_exists takusan/nicaraguan_cuisine/carne_pinchada.txt
  touch_file_if_not_exists takusan/nicaraguan_cuisine/quesillo.txt
  touch_file_if_not_exists takusan/nicaraguan_cuisine/nacatamal.txt
  touch_file_if_not_exists takusan/nicaraguan_cuisine/rondón.txt
  touch_file_if_not_exists takusan/nicaraguan_cuisine/salpicón.txt
  touch_file_if_not_exists takusan/nicaraguan_cuisine/sopa_de_albóndigas.txt
  touch_file_if_not_exists takusan/nicaraguan_cuisine/sopa_de_mondongo.txt
  touch_file_if_not_exists takusan/nicaraguan_cuisine/chicharrón_con_chimichurri.txt
  touch_file_if_not_exists takusan/nicaraguan_cuisine/churrasco_con_chimichurri.txt
  touch_file_if_not_exists takusan/nicaraguan_cuisine/gallina_rellena.txt
  touch_file_if_not_exists takusan/nicaraguan_cuisine/gallo_pinto.txt
  touch_file_if_not_exists takusan/nicaraguan_cuisine/güirila.txt
  touch_file_if_not_exists takusan/nicaraguan_cuisine/tamales.txt
  touch_file_if_not_exists takusan/nicaraguan_cuisine/tostones.txt
  touch_file_if_not_exists takusan/nicaraguan_cuisine/vaho.txt
  touch_file_if_not_exists takusan/nicaraguan_cuisine/vigorón.txt
  touch_file_if_not_exists takusan/nicaraguan_cuisine/lengua.csv
  touch_file_if_not_exists takusan/nicaraguan_cuisine/indio_viejo.txt
  make_directory_if_not_exists takusan/panamanian_cuisine
  touch_file_if_not_exists takusan/panamanian_cuisine/almojábanos.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/arroz_con_camarones_y_coco.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/arroz_con_chorizo_y_ajíes_dulces.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/arroz_con_pollo.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/arroz_con_puerco_y_vegetales.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/arroz_verde.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/bistec_de_higado.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/bistec_picado.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/bollos.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/carne_entomatada.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/carimañola.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/ceviche.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/chorizo_con_vegetales.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/chuletas_en_salsa_de_piña.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/empanadas.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/ensalada_de_papas.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/gaucho_soup.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/hojaldres.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/lengua_guisada.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/mondongo_a_la_culona.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/pernil_de_puerco_al_horno.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/plátano_en_tentacion.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/ropa_vieja.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/salpicón_de_carne.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/sancocho.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/tamal_de_olla.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/tamales.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/tortillas.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/torrejitas.txt
  touch_file_if_not_exists takusan/panamanian_cuisine/tasajo.txt
  make_directory_if_not_exists takusan/bolivian_cuisine
  touch_file_if_not_exists takusan/bolivian_cuisine/arroz_con_queso.txt
  touch_file_if_not_exists takusan/bolivian_cuisine/charque.txt
  touch_file_if_not_exists takusan/bolivian_cuisine/ají_of_noodles.txt
  touch_file_if_not_exists takusan/bolivian_cuisine/saice.txt
  touch_file_if_not_exists takusan/bolivian_cuisine/fricasé.txt
  touch_file_if_not_exists takusan/bolivian_cuisine/pique_macho.txt
  touch_file_if_not_exists takusan/bolivian_cuisine/salteñas.txt
  touch_file_if_not_exists takusan/bolivian_cuisine/sopa_de_maní.txt
  touch_file_if_not_exists takusan/bolivian_cuisine/silpancho.txt
  make_directory_if_not_exists takusan/brazilian_cuisine
  touch_file_if_not_exists takusan/brazilian_cuisine/rice_and_beans.txt
  touch_file_if_not_exists takusan/brazilian_cuisine/churrasco.txt
  touch_file_if_not_exists takusan/brazilian_cuisine/picanha.txt
  touch_file_if_not_exists takusan/brazilian_cuisine/farofa.txt
  touch_file_if_not_exists takusan/brazilian_cuisine/bife_à_cavalo.txt
  touch_file_if_not_exists takusan/brazilian_cuisine/bife_à_parmegiana.txt
  touch_file_if_not_exists takusan/brazilian_cuisine/virado.txt
  touch_file_if_not_exists takusan/brazilian_cuisine/tutu_de_feijão.txt
  touch_file_if_not_exists takusan/brazilian_cuisine/arroz_carreteiro.txt
  touch_file_if_not_exists takusan/brazilian_cuisine/galinhada.txt
  touch_file_if_not_exists takusan/brazilian_cuisine/barreado.txt
  touch_file_if_not_exists takusan/brazilian_cuisine/pizza.txt
  touch_file_if_not_exists takusan/brazilian_cuisine/cachorro_quente.txt
  touch_file_if_not_exists takusan/brazilian_cuisine/misto-quente.txt
  touch_file_if_not_exists takusan/brazilian_cuisine/angu.txt
  touch_file_if_not_exists takusan/brazilian_cuisine/arroz_com_pequi.txt
  touch_file_if_not_exists takusan/brazilian_cuisine/cuscuz_branco.txt
  touch_file_if_not_exists takusan/brazilian_cuisine/açaí.txt
  touch_file_if_not_exists takusan/brazilian_cuisine/mortadella_sandwich.txt
  make_directory_if_not_exists takusan/chilean_cuisine
  touch_file_if_not_exists takusan/chilean_cuisine/asado.txt
  touch_file_if_not_exists takusan/chilean_cuisine/chairo.txt
  touch_file_if_not_exists takusan/chilean_cuisine/carapulcra.txt
  touch_file_if_not_exists takusan/chilean_cuisine/erizos.txt
  touch_file_if_not_exists takusan/chilean_cuisine/estofado_de_cordero:.txt
  touch_file_if_not_exists takusan/chilean_cuisine/cazuela_marina.txt
  touch_file_if_not_exists takusan/chilean_cuisine/sango.txt
  touch_file_if_not_exists takusan/chilean_cuisine/pastel_de_jaiba.txt
  touch_file_if_not_exists takusan/chilean_cuisine/tomaticán.txt
  touch_file_if_not_exists takusan/chilean_cuisine/albóndigas_al_jugo.txt
  touch_file_if_not_exists takusan/chilean_cuisine/sopa_de_mariscos.txt
  touch_file_if_not_exists takusan/chilean_cuisine/humitas.txt
  touch_file_if_not_exists takusan/chilean_cuisine/pan_amasado.txt
  touch_file_if_not_exists takusan/chilean_cuisine/leche_asada.txt
  make_directory_if_not_exists takusan/colombian_cuisine
  touch_file_if_not_exists takusan/colombian_cuisine/arepas.txt
  touch_file_if_not_exists takusan/colombian_cuisine/aborrajado.txt
  touch_file_if_not_exists takusan/colombian_cuisine/arroz_con_coco.txt
  touch_file_if_not_exists takusan/colombian_cuisine/hormigas_culonas.txt
  touch_file_if_not_exists takusan/colombian_cuisine/butifarras_soledeñas.txt
  touch_file_if_not_exists takusan/colombian_cuisine/carimañola.txt
  touch_file_if_not_exists takusan/colombian_cuisine/chunchullo.txt
  touch_file_if_not_exists takusan/colombian_cuisine/hogao.txt
  touch_file_if_not_exists takusan/colombian_cuisine/queso_blanco.txt
  touch_file_if_not_exists takusan/colombian_cuisine/suero.txt
  touch_file_if_not_exists takusan/colombian_cuisine/patacones.txt
  touch_file_if_not_exists takusan/colombian_cuisine/empanadas.txt
  touch_file_if_not_exists takusan/colombian_cuisine/chicharron.csv
  touch_file_if_not_exists takusan/colombian_cuisine/lentil_soup.txt
  make_directory_if_not_exists takusan/paraguayan_cuisine
  touch_file_if_not_exists takusan/paraguayan_cuisine/chipa.txt
  touch_file_if_not_exists takusan/paraguayan_cuisine/chipa_guesu.txt
  touch_file_if_not_exists takusan/paraguayan_cuisine/kiveve.txt
  touch_file_if_not_exists takusan/paraguayan_cuisine/lampreado.txt
  touch_file_if_not_exists takusan/paraguayan_cuisine/mazamorra.txt
  touch_file_if_not_exists takusan/paraguayan_cuisine/mbaipy-so-ó.txt
  touch_file_if_not_exists takusan/paraguayan_cuisine/mbejú.txt
  touch_file_if_not_exists takusan/paraguayan_cuisine/milanesa.txt
  touch_file_if_not_exists takusan/paraguayan_cuisine/parrillada.txt
  touch_file_if_not_exists takusan/paraguayan_cuisine/pira_caldo.txt
  touch_file_if_not_exists takusan/paraguayan_cuisine/sopa_paraguaya.txt
  touch_file_if_not_exists takusan/paraguayan_cuisine/soyo.txt
  touch_file_if_not_exists takusan/paraguayan_cuisine/vori_vori.txt
  make_directory_if_not_exists takusan/venezuelan_cuisine
  touch_file_if_not_exists takusan/venezuelan_cuisine/arepa.txt
  touch_file_if_not_exists takusan/venezuelan_cuisine/arepa_andiha.txt
  touch_file_if_not_exists takusan/venezuelan_cuisine/cachapa.txt
  touch_file_if_not_exists takusan/venezuelan_cuisine/cachitos.txt
  touch_file_if_not_exists takusan/venezuelan_cuisine/caraotas_negras.txt
  touch_file_if_not_exists takusan/venezuelan_cuisine/casabe.txt
  touch_file_if_not_exists takusan/venezuelan_cuisine/chicharrón.txt
  touch_file_if_not_exists takusan/venezuelan_cuisine/chupe_andino.txt
  touch_file_if_not_exists takusan/venezuelan_cuisine/ensalada_de_pollo.txt
  touch_file_if_not_exists takusan/venezuelan_cuisine/hallaca.txt
  touch_file_if_not_exists takusan/venezuelan_cuisine/humitas.txt
  touch_file_if_not_exists takusan/venezuelan_cuisine/huevos_pericos.txt
  touch_file_if_not_exists takusan/venezuelan_cuisine/hervido_de_gallina.txt
  touch_file_if_not_exists takusan/venezuelan_cuisine/mandoca.txt
  touch_file_if_not_exists takusan/venezuelan_cuisine/mondongo.txt
  touch_file_if_not_exists takusan/venezuelan_cuisine/pabellón_criollo.txt
  touch_file_if_not_exists takusan/venezuelan_cuisine/pastel_de_chucho.txt
  touch_file_if_not_exists takusan/venezuelan_cuisine/polvorosa_de_pollo.txt
  touch_file_if_not_exists takusan/venezuelan_cuisine/pastelitos.txt
  touch_file_if_not_exists takusan/venezuelan_cuisine/pasticho.txt
  touch_file_if_not_exists takusan/venezuelan_cuisine/polenta.txt
  make_directory_if_not_exists takusan/anguillian_cuisine
  touch_file_if_not_exists takusan/anguillian_cuisine/callalloo.txt
  touch_file_if_not_exists takusan/anguillian_cuisine/dumplings.txt
  make_directory_if_not_exists takusan/barbadian_cuisine
  touch_file_if_not_exists takusan/barbadian_cuisine/fried_flying_fish.txt
  touch_file_if_not_exists takusan/barbadian_cuisine/brown_stew_chicken.txt
  touch_file_if_not_exists takusan/barbadian_cuisine/cou-cou_and_steamed_flying_fish.txt
  touch_file_if_not_exists takusan/barbadian_cuisine/rotisserie_chicken.txt
  touch_file_if_not_exists takusan/barbadian_cuisine/pepperpot.txt
  touch_file_if_not_exists takusan/barbadian_cuisine/sweet_potato_pie.txt
  touch_file_if_not_exists takusan/barbadian_cuisine/pickled_chicken_feet.txt
  touch_file_if_not_exists takusan/barbadian_cuisine/guava_cheese.txt
  touch_file_if_not_exists takusan/barbadian_cuisine/cou-cou.txt
  make_directory_if_not_exists takusan/jamaican_cuisine
  touch_file_if_not_exists takusan/jamaican_cuisine/bammy.txt
  touch_file_if_not_exists takusan/jamaican_cuisine/bulla_cake.txt
  touch_file_if_not_exists takusan/jamaican_cuisine/coco_bread.txt
  touch_file_if_not_exists takusan/jamaican_cuisine/grotto.txt
  touch_file_if_not_exists takusan/jamaican_cuisine/peg_bread.txt
  touch_file_if_not_exists takusan/jamaican_cuisine/spiced_bun.txt
  touch_file_if_not_exists takusan/jamaican_cuisine/bok_choy.txt
  touch_file_if_not_exists takusan/jamaican_cuisine/fried_rice.txt
  touch_file_if_not_exists takusan/jamaican_cuisine/pepperpot.txt
  make_directory_if_not_exists takusan/montserrat_cuisine
  touch_file_if_not_exists takusan/montserrat_cuisine/salt_fish.txt
  touch_file_if_not_exists takusan/montserrat_cuisine/mountain_chicken.txt
  touch_file_if_not_exists takusan/montserrat_cuisine/pumpkin_soup.txt
  touch_file_if_not_exists takusan/montserrat_cuisine/goat_water.txt
  touch_file_if_not_exists takusan/montserrat_cuisine/fish_cakes.txt
  touch_file_if_not_exists takusan/montserrat_cuisine/duckna.csv
  touch_file_if_not_exists takusan/montserrat_cuisine/cassava_bread.txt
  make_directory_if_not_exists takusan/azerbaijani_cuisine
  touch_file_if_not_exists takusan/azerbaijani_cuisine/balıq.txt
  touch_file_if_not_exists takusan/azerbaijani_cuisine/dolma.txt
  touch_file_if_not_exists takusan/azerbaijani_cuisine/badımcan_dolması.txt
  touch_file_if_not_exists takusan/azerbaijani_cuisine/dushbara.txt
  touch_file_if_not_exists takusan/azerbaijani_cuisine/lavangi.txt
  touch_file_if_not_exists takusan/azerbaijani_cuisine/lula_kebab.txt
  touch_file_if_not_exists takusan/azerbaijani_cuisine/qutab.txt
  touch_file_if_not_exists takusan/azerbaijani_cuisine/tika_kebab.txt
  touch_file_if_not_exists takusan/azerbaijani_cuisine/qovurma.txt
  touch_file_if_not_exists takusan/azerbaijani_cuisine/sogan_dolmasi.txt
  touch_file_if_not_exists takusan/azerbaijani_cuisine/tebriz_kuftesi.txt
  touch_file_if_not_exists takusan/azerbaijani_cuisine/bastirma.txt
  touch_file_if_not_exists takusan/azerbaijani_cuisine/piti.txt
  touch_file_if_not_exists takusan/azerbaijani_cuisine/kufta_bozbash.txt
  touch_file_if_not_exists takusan/azerbaijani_cuisine/dovga.txt
  touch_file_if_not_exists takusan/azerbaijani_cuisine/ovdukh.txt
  touch_file_if_not_exists takusan/azerbaijani_cuisine/dogramach.txt
  touch_file_if_not_exists takusan/azerbaijani_cuisine/kourma_plov.txt
  touch_file_if_not_exists takusan/azerbaijani_cuisine/chilov_plov.txt
  touch_file_if_not_exists takusan/azerbaijani_cuisine/sabzi_qovurma_plov.txt
  touch_file_if_not_exists takusan/azerbaijani_cuisine/toyug_plov.txt
  touch_file_if_not_exists takusan/azerbaijani_cuisine/shuyudli_plov.txt
  touch_file_if_not_exists takusan/azerbaijani_cuisine/shirin_plov.txt
  touch_file_if_not_exists takusan/azerbaijani_cuisine/shudli_plov.txt
  make_directory_if_not_exists takusan/kazakh_cuisine
  touch_file_if_not_exists takusan/kazakh_cuisine/төрт_түлiк_мал.txt
  touch_file_if_not_exists takusan/kazakh_cuisine/ет.txt
  touch_file_if_not_exists takusan/kazakh_cuisine/бесбармақ.txt
  touch_file_if_not_exists takusan/kazakh_cuisine/кесе.txt
  touch_file_if_not_exists takusan/kazakh_cuisine/сорпа.txt
  touch_file_if_not_exists takusan/kazakh_cuisine/қуырдақ.txt
  touch_file_if_not_exists takusan/kazakh_cuisine/қазы.txt
  touch_file_if_not_exists takusan/kazakh_cuisine/шұжық.txt
  touch_file_if_not_exists takusan/kazakh_cuisine/жая.txt
  touch_file_if_not_exists takusan/kazakh_cuisine/жал.txt
  touch_file_if_not_exists takusan/kazakh_cuisine/палау.txt
  touch_file_if_not_exists takusan/kazakh_cuisine/қимай.txt
  touch_file_if_not_exists takusan/kazakh_cuisine/жаубүйрек.txt
  touch_file_if_not_exists takusan/kazakh_cuisine/кәуап.txt
  touch_file_if_not_exists takusan/kazakh_cuisine/үлпершек.txt
  touch_file_if_not_exists takusan/kazakh_cuisine/құйрық-бауыр.txt
  touch_file_if_not_exists takusan/kazakh_cuisine/сүр_ет.txt
  touch_file_if_not_exists takusan/kazakh_cuisine/.txt
  touch_file_if_not_exists takusan/kazakh_cuisine/.txt
  touch_file_if_not_exists takusan/kazakh_cuisine/.txt
  touch_file_if_not_exists takusan/kazakh_cuisine/.txt
  touch_file_if_not_exists takusan/kazakh_cuisine/.txt
  touch_file_if_not_exists takusan/kazakh_cuisine/.txt
  touch_file_if_not_exists takusan/kazakh_cuisine/.txt
  make_directory_if_not_exists takusan/kyrgyz_cuisine
  touch_file_if_not_exists takusan/kyrgyz_cuisine/beshbarmak.txt
  touch_file_if_not_exists takusan/kyrgyz_cuisine/dimlama.txt
  touch_file_if_not_exists takusan/kyrgyz_cuisine/kuurdak.txt
  touch_file_if_not_exists takusan/kyrgyz_cuisine/shashlik.txt
  touch_file_if_not_exists takusan/kyrgyz_cuisine/shorpo.txt
  touch_file_if_not_exists takusan/kyrgyz_cuisine/laghman.txt
  touch_file_if_not_exists takusan/kyrgyz_cuisine/paloo.txt
  make_directory_if_not_exists takusan/tatar_cuisine
  touch_file_if_not_exists takusan/tatar_cuisine/Äyrän.txt
  touch_file_if_not_exists takusan/tatar_cuisine/bäleş.txt
  touch_file_if_not_exists takusan/tatar_cuisine/bäkkän.txt
  touch_file_if_not_exists takusan/tatar_cuisine/bawırsaq.txt
  touch_file_if_not_exists takusan/tatar_cuisine/börek.txt
  touch_file_if_not_exists takusan/tatar_cuisine/Çäkçäk.txt
  touch_file_if_not_exists takusan/tatar_cuisine/chee-börek.txt
  touch_file_if_not_exists takusan/tatar_cuisine/göbädiä.txt
  touch_file_if_not_exists takusan/tatar_cuisine/Öçpoçmaq.txt
  touch_file_if_not_exists takusan/tatar_cuisine/pärämäç.txt
  touch_file_if_not_exists takusan/tatar_cuisine/pilmän.txt
  touch_file_if_not_exists takusan/tatar_cuisine/qıstıbí.txt
  touch_file_if_not_exists takusan/tatar_cuisine/Şulpa.txt
  touch_file_if_not_exists takusan/tatar_cuisine/toqmaç.txt
  touch_file_if_not_exists takusan/tatar_cuisine/tutırğan_tawıq.txt
  touch_file_if_not_exists takusan/tatar_cuisine/tutırma.txt
  touch_file_if_not_exists takusan/tatar_cuisine/ulish.txt
  make_directory_if_not_exists takusan/mongolian_cuisine
  touch_file_if_not_exists takusan/mongolian_cuisine/khorkhog.txt
  touch_file_if_not_exists takusan/mongolian_cuisine/buuz.txt
  touch_file_if_not_exists takusan/mongolian_cuisine/süütei_tsai.txt
  touch_file_if_not_exists takusan/mongolian_cuisine/aaruul.txt
  make_directory_if_not_exists takusan/sikkimese_cuisine
  touch_file_if_not_exists takusan/sikkimese_cuisine/chhurpi.txt
  touch_file_if_not_exists takusan/sikkimese_cuisine/dal_bhat.txt
  touch_file_if_not_exists takusan/sikkimese_cuisine/dhindo.txt
  touch_file_if_not_exists takusan/sikkimese_cuisine/gundruk.txt
  touch_file_if_not_exists takusan/sikkimese_cuisine/kinema.txt
  touch_file_if_not_exists takusan/sikkimese_cuisine/momo.txt
  touch_file_if_not_exists takusan/sikkimese_cuisine/phagshapa.txt
  touch_file_if_not_exists takusan/sikkimese_cuisine/sel_roti.txt
  touch_file_if_not_exists takusan/sikkimese_cuisine/sinki.txt
  touch_file_if_not_exists takusan/sikkimese_cuisine/shabhaley.txt
  touch_file_if_not_exists takusan/sikkimese_cuisine/thukpa.txt
  make_directory_if_not_exists takusan/tibetan_cuisine
  touch_file_if_not_exists takusan/tibetan_cuisine/sha_phaley.txt
  touch_file_if_not_exists takusan/tibetan_cuisine/balep_korkun.txt
  touch_file_if_not_exists takusan/tibetan_cuisine/tingmo.txt
  touch_file_if_not_exists takusan/tibetan_cuisine/thenthuk.txt
  touch_file_if_not_exists takusan/tibetan_cuisine/shab_ta.txt
  touch_file_if_not_exists takusan/tibetan_cuisine/gyurma.txt
  touch_file_if_not_exists takusan/tibetan_cuisine/shokham_bexe.txt
  touch_file_if_not_exists takusan/tibetan_cuisine/dtowa_katsa.txt
  touch_file_if_not_exists takusan/tibetan_cuisine/lunggoi_katsa.txt
  touch_file_if_not_exists takusan/tibetan_cuisine/thue.txt
  touch_file_if_not_exists takusan/tibetan_cuisine/masan.txt
  touch_file_if_not_exists takusan/tibetan_cuisine/shogo_momo.txt
  touch_file_if_not_exists takusan/tibetan_cuisine/samkham_papleg.txt
  touch_file_if_not_exists takusan/tibetan_cuisine/papza_mogu.txt
  touch_file_if_not_exists takusan/tibetan_cuisine/de-thuk.txt
  touch_file_if_not_exists takusan/tibetan_cuisine/tsam-thuk.txt
  touch_file_if_not_exists takusan/tibetan_cuisine/khapsey.txt
  make_directory_if_not_exists takusan/russian_cuisine
  touch_file_if_not_exists takusan/russian_cuisine/борщ.txt
  touch_file_if_not_exists takusan/russian_cuisine/уха́.txt
  touch_file_if_not_exists takusan/russian_cuisine/рассо́льник.txt
  touch_file_if_not_exists takusan/russian_cuisine/соля́нка.txt
  touch_file_if_not_exists takusan/russian_cuisine/щи.txt
  touch_file_if_not_exists takusan/russian_cuisine/ботви́нья.txt
  touch_file_if_not_exists takusan/russian_cuisine/окро́шка.txt
  touch_file_if_not_exists takusan/russian_cuisine/тю́ря.txt
  touch_file_if_not_exists takusan/russian_cuisine/.txt
  touch_file_if_not_exists takusan/russian_cuisine/.txt
  touch_file_if_not_exists takusan/russian_cuisine/.txt
  make_directory_if_not_exists takusan/buryat_cuisine
  touch_file_if_not_exists takusan/buryat_cuisine/Бузы.txt
  touch_file_if_not_exists takusan/buryat_cuisine/Бучлер.txt
  touch_file_if_not_exists takusan/buryat_cuisine/Шулэн.txt
  touch_file_if_not_exists takusan/buryat_cuisine/Бухел.txt
  touch_file_if_not_exists takusan/buryat_cuisine/Сагудаи.txt
  touch_file_if_not_exists takusan/buryat_cuisine/Хушуур.txt
  touch_file_if_not_exists takusan/buryat_cuisine/Шарбин.txt
  touch_file_if_not_exists takusan/buryat_cuisine/Шанки.txt
  touch_file_if_not_exists takusan/buryat_cuisine/Саламата.txt
  touch_file_if_not_exists takusan/buryat_cuisine/Аирхан.txt
  touch_file_if_not_exists takusan/buryat_cuisine/Хурууд.txt
  touch_file_if_not_exists takusan/buryat_cuisine/Урме.txt
  make_directory_if_not_exists takusan/sri_lankan_cuisine
  touch_file_if_not_exists takusan/sri_lankan_cuisine/rice_and_curry.txt
  touch_file_if_not_exists takusan/sri_lankan_cuisine/kiribath.txt
  touch_file_if_not_exists takusan/sri_lankan_cuisine/kottu.txt
  touch_file_if_not_exists takusan/sri_lankan_cuisine/hoppers.txt
  touch_file_if_not_exists takusan/sri_lankan_cuisine/string_hoppers.txt
  touch_file_if_not_exists takusan/sri_lankan_cuisine/lamprais.txt
  touch_file_if_not_exists takusan/sri_lankan_cuisine/kool.txt
  touch_file_if_not_exists takusan/sri_lankan_cuisine/pittu.txt
  touch_file_if_not_exists takusan/sri_lankan_cuisine/roti.txt
  touch_file_if_not_exists takusan/sri_lankan_cuisine/sambal.txt
  touch_file_if_not_exists takusan/sri_lankan_cuisine/mallung.txt
  touch_file_if_not_exists takusan/sri_lankan_cuisine/malay_achcharu.txt
  touch_file_if_not_exists takusan/sri_lankan_cuisine/babath.txt
  touch_file_if_not_exists takusan/sri_lankan_cuisine/sate.txt
  touch_file_if_not_exists takusan/sri_lankan_cuisine/ekor_sop.txt
  touch_file_if_not_exists takusan/sri_lankan_cuisine/nasi_goreng.txt
  make_directory_if_not_exists takusan/burmese_cuisine
  touch_file_if_not_exists takusan/burmese_cuisine/ထမင်းကြော်.txt
  touch_file_if_not_exists takusan/burmese_cuisine/ဆန်ပြုတ်.txt
  touch_file_if_not_exists takusan/burmese_cuisine/ဒံပေါက်.txt
  touch_file_if_not_exists takusan/burmese_cuisine/ထမင်းချဉ်‌.txt
  touch_file_if_not_exists takusan/burmese_cuisine/သင်္ကြန်ထမင်း.txt
  touch_file_if_not_exists takusan/burmese_cuisine/ကတ်ကြေးကိုက်.txt
  touch_file_if_not_exists takusan/burmese_cuisine/မြီးရှည်.txt
  touch_file_if_not_exists takusan/burmese_cuisine/ပန်းသေးခေါက်ဆွဲ.txt
  touch_file_if_not_exists takusan/burmese_cuisine/ဆီချက်ခေါက်ဆွဲ.txt
  touch_file_if_not_exists takusan/burmese_cuisine/မုန့်ဟင်းခါး.txt
  touch_file_if_not_exists takusan/burmese_cuisine/အုန်းနို့ခေါက်ဆွဲ.txt
  touch_file_if_not_exists takusan/burmese_cuisine/ကြေးအိုး.txt
  touch_file_if_not_exists takusan/burmese_cuisine/ကော်ရည်ခေါက်ဆွဲ.txt
  touch_file_if_not_exists takusan/burmese_cuisine/မြူစွမ်.txt
  touch_file_if_not_exists takusan/burmese_cuisine/ရှမ်းခေါက်ဆွဲ.txt
  touch_file_if_not_exists takusan/burmese_cuisine/လက်ဖက်သုပ်.txt
  touch_file_if_not_exists takusan/burmese_cuisine/ချင်းသုပ်‌.txt
  touch_file_if_not_exists takusan/burmese_cuisine/လက်သုပ်စုံ.txt
  touch_file_if_not_exists takusan/burmese_cuisine/နန်းကြီးသုပ်.txt
  touch_file_if_not_exists takusan/burmese_cuisine/စမူဆာသုပ်.txt
  touch_file_if_not_exists takusan/burmese_cuisine/ဝက်သားဆီပြန်.txt
  make_directory_if_not_exists takusan/hmong_cuisine
  touch_file_if_not_exists takusan/hmong_cuisine/kua_txob_ntsw.txt
  touch_file_if_not_exists takusan/hmong_cuisine/mov_nplaum_ntshaav.txt
  touch_file_if_not_exists takusan/hmong_cuisine/nyhuv_ntxwm_hmoob.txt
  touch_file_if_not_exists takusan/hmong_cuisine/kooj_tis_qaib_nitim.txt
  touch_file_if_not_exists takusan/hmong_cuisine/kab_yaub.txt
  touch_file_if_not_exists takusan/hmong_cuisine/nab_vam.txt
  touch_file_if_not_exists takusan/hmong_cuisine/khaub_piaj.txt
  touch_file_if_not_exists takusan/hmong_cuisine/zaub_qaub.txt
  make_directory_if_not_exists takusan/kachin_cuisine
  touch_file_if_not_exists takusan/kachin_cuisine/shat_jam.txt
  touch_file_if_not_exists takusan/kachin_cuisine/shan_hkak.txt
  touch_file_if_not_exists takusan/kachin_cuisine/japhtu.txt
  touch_file_if_not_exists takusan/kachin_cuisine/si_pa.txt
  touch_file_if_not_exists takusan/kachin_cuisine/silu.txt
  make_directory_if_not_exists takusan/manipuri_cuisine
  touch_file_if_not_exists takusan/manipuri_cuisine/eromba.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/singju.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/kangshoi.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/kang-ngou.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/morok_metpa.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/nganam.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/paaknam.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/nga_thongba.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/nga_ataoba_thongba.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/nga_atoiba.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/ooti.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/pakoura_thongba.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/chagem_pomba.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/keli_chana.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/alu_kangmet.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/sana_thongba.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/yen_thongba.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/nganu_thongba.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/oak_thongba.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/san_thongba.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/hameng_thongba.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/tharoi_thangba.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/pan_hawaijar_thongba.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/soibum_thongba.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/chahao_kheer.txt
  touch_file_if_not_exists takusan/manipuri_cuisine/tilhou_kheer.txt
  make_directory_if_not_exists takusan/mizo_cuisine
  touch_file_if_not_exists takusan/mizo_cuisine/bai.txt
  touch_file_if_not_exists takusan/mizo_cuisine/rep.txt
  touch_file_if_not_exists takusan/mizo_cuisine/chhum_han.txt
  touch_file_if_not_exists takusan/mizo_cuisine/hmarcha_rawt.txt
  touch_file_if_not_exists takusan/mizo_cuisine/dal.txt
  touch_file_if_not_exists takusan/mizo_cuisine/bekang.txt
  touch_file_if_not_exists takusan/mizo_cuisine/sanpiau.txt
  touch_file_if_not_exists takusan/mizo_cuisine/chhangban.txt
  touch_file_if_not_exists takusan/mizo_cuisine/alu_chop.txt
  touch_file_if_not_exists takusan/mizo_cuisine/sawhchiar.txt
  make_directory_if_not_exists takusan/east_timor_cuisine
  touch_file_if_not_exists takusan/east_timor_cuisine/batar_daan.txt
  touch_file_if_not_exists takusan/east_timor_cuisine/budu.txt
  touch_file_if_not_exists takusan/east_timor_cuisine/fuuntaul_tong_and_gailong.txt
  touch_file_if_not_exists takusan/east_timor_cuisine/tapai.txt
  touch_file_if_not_exists takusan/east_timor_cuisine/ikan_sabuko.txt
  touch_file_if_not_exists takusan/east_timor_cuisine/caril.txt
  touch_file_if_not_exists takusan/east_timor_cuisine/feijoada.txt
  make_directory_if_not_exists takusan/levantine_cuisine
  touch_file_if_not_exists takusan/levantine_cuisine/بابا_غنوج.txt
  touch_file_if_not_exists takusan/levantine_cuisine/سلطة_حمص.txt
  touch_file_if_not_exists takusan/levantine_cuisine/مفركة.txt
  touch_file_if_not_exists takusan/levantine_cuisine/مكدوس.txt
  touch_file_if_not_exists takusan/levantine_cuisine/مناقيش.txt
  touch_file_if_not_exists takusan/levantine_cuisine/سمبوسك.txt
  touch_file_if_not_exists takusan/levantine_cuisine/صفيحة.txt
  touch_file_if_not_exists takusan/levantine_cuisine/شنكليش.txt
  touch_file_if_not_exists takusan/levantine_cuisine/شاورما.txt
  touch_file_if_not_exists takusan/levantine_cuisine/تبولة.txt
  touch_file_if_not_exists takusan/levantine_cuisine/بامية.txt
  touch_file_if_not_exists takusan/levantine_cuisine/محشي.txt
  touch_file_if_not_exists takusan/levantine_cuisine/فاصوليا.txt
  touch_file_if_not_exists takusan/levantine_cuisine/فتّة.txt
  make_directory_if_not_exists takusan/austrian_cuisine
  touch_file_if_not_exists takusan/austrian_cuisine/rindsuppe.txt
  touch_file_if_not_exists takusan/austrian_cuisine/tafelspitz.txt
  touch_file_if_not_exists takusan/austrian_cuisine/gulasch.txt
  touch_file_if_not_exists takusan/austrian_cuisine/beuschel.txt
  touch_file_if_not_exists takusan/austrian_cuisine/liptauer.txt
  touch_file_if_not_exists takusan/austrian_cuisine/selchfleisch.txt
  touch_file_if_not_exists takusan/austrian_cuisine/powidl.txt
  touch_file_if_not_exists takusan/austrian_cuisine/apfelstrudel.txt
  touch_file_if_not_exists takusan/austrian_cuisine/topfenstrudel.txt
  touch_file_if_not_exists takusan/austrian_cuisine/millirahmstrudel.txt
  touch_file_if_not_exists takusan/austrian_cuisine/palatschinken.txt
  touch_file_if_not_exists takusan/austrian_cuisine/kaiserschmarrn.txt
  touch_file_if_not_exists takusan/austrian_cuisine/germknödel.txt
  touch_file_if_not_exists takusan/austrian_cuisine/saftgulasch.txt
  touch_file_if_not_exists takusan/austrian_cuisine/wurstsemmel.txt
  touch_file_if_not_exists takusan/austrian_cuisine/krautfleisch.txt
  touch_file_if_not_exists takusan/austrian_cuisine/krautspatzle.txt
  make_directory_if_not_exists takusan/czech_cuisine
  touch_file_if_not_exists takusan/czech_cuisine/guláš.txt
  touch_file_if_not_exists takusan/czech_cuisine/pečené_vepřové_s_knedlíky_a_se_zelím,_colloquially_vepřo-knedlo-zelo.txt
  touch_file_if_not_exists takusan/czech_cuisine/svíčková.txt
  touch_file_if_not_exists takusan/czech_cuisine/sekaná_pečeně.txt
  touch_file_if_not_exists takusan/czech_cuisine/šunka.txt
  touch_file_if_not_exists takusan/czech_cuisine/řízek.txt
  touch_file_if_not_exists takusan/czech_cuisine/karbanátek.txt
  touch_file_if_not_exists takusan/czech_cuisine/uzené.txt
  touch_file_if_not_exists takusan/czech_cuisine/rajská.txt
  make_directory_if_not_exists takusan/hungarian_cuisine
  touch_file_if_not_exists takusan/hungarian_cuisine/gulyásleves.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/halászlé.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/húsleves.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/gyümölcsleves.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/meggyleves.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/jókai_bean_soup.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/csontleves.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/gombaleves.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/palócleves.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/vadgombaleves.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/zöldségleves.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/sóskaleves.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/krumplileves.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/pacalleves.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/borleves.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/köménymagleves.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/tojásleves.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/csirkepaprikás.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/paprikás_krumpli.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/császármorzsa.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/főzelék.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/lecsó.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/székelykáposzta.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/fasírozott.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/stefánia_szelet.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/pörkölt.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/palacsinta.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/gundel_palacsinta.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/hortobágyi_palacsinta.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/liptai_túró.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/rántott_sajt.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/rántott_hús.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/rántott_csirke.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/rakott_krumpli.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/rakott_káposzta.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/rakott_zöldbab.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/slambuc.txt
  touch_file_if_not_exists takusan/hungarian_cuisine/sólet.txt
  make_directory_if_not_exists takusan/liechtenstein_cuisine
  touch_file_if_not_exists takusan/liechtenstein_cuisine/hafalaab.txt
  touch_file_if_not_exists takusan/liechtenstein_cuisine/kasknopfl.txt
  touch_file_if_not_exists takusan/liechtenstein_cuisine/muesli.txt
  touch_file_if_not_exists takusan/liechtenstein_cuisine/ribel.txt
  touch_file_if_not_exists takusan/liechtenstein_cuisine/rösti.txt
  touch_file_if_not_exists takusan/liechtenstein_cuisine/saukerkas.txt
  touch_file_if_not_exists takusan/liechtenstein_cuisine/wurst.txt
  touch_file_if_not_exists takusan/liechtenstein_cuisine/schnitzel.txt
  make_directory_if_not_exists takusan/slovak_cuisine
  touch_file_if_not_exists takusan/slovak_cuisine/halušky.txt
  touch_file_if_not_exists takusan/slovak_cuisine/husacie.txt
  touch_file_if_not_exists takusan/slovak_cuisine/bryndzové_pirohy.txt
  touch_file_if_not_exists takusan/slovak_cuisine/zemiakové_placky.txt
  touch_file_if_not_exists takusan/slovak_cuisine/Široké_rezance_s_tvarohom_a_slaninou.txt
  touch_file_if_not_exists takusan/slovak_cuisine/granadír.txt
  touch_file_if_not_exists takusan/slovak_cuisine/kuracie_prsia_s_broskyňou.txt
  touch_file_if_not_exists takusan/slovak_cuisine/džatky.txt
  touch_file_if_not_exists takusan/slovak_cuisine/segedínsky_guláš.txt
  touch_file_if_not_exists takusan/slovak_cuisine/rezeň.txt
  make_directory_if_not_exists takusan/slovenian_cuisine
  touch_file_if_not_exists takusan/slovenian_cuisine/ajdovi_žganci.txt
  touch_file_if_not_exists takusan/slovenian_cuisine/belokranjska_povitica.txt
  touch_file_if_not_exists takusan/slovenian_cuisine/bujta_repa.txt
  touch_file_if_not_exists takusan/slovenian_cuisine/funšterc.txt
  touch_file_if_not_exists takusan/slovenian_cuisine/kmečka_pojedina.txt
  touch_file_if_not_exists takusan/slovenian_cuisine/kranjska_klobasa.txt
  touch_file_if_not_exists takusan/slovenian_cuisine/matevž.txt
  touch_file_if_not_exists takusan/slovenian_cuisine/mavželj.txt
  touch_file_if_not_exists takusan/slovenian_cuisine/mežerli.txt
  touch_file_if_not_exists takusan/slovenian_cuisine/mineštra.txt
  touch_file_if_not_exists takusan/slovenian_cuisine/obara.txt
  touch_file_if_not_exists takusan/slovenian_cuisine/pirh.txt
  touch_file_if_not_exists takusan/slovenian_cuisine/potica.txt
  touch_file_if_not_exists takusan/slovenian_cuisine/prekmurska_gibanica.txt
  touch_file_if_not_exists takusan/slovenian_cuisine/ričet.txt
  touch_file_if_not_exists takusan/slovenian_cuisine/Špehovka.txt
  touch_file_if_not_exists takusan/slovenian_cuisine/vipavska_jota.txt
  make_directory_if_not_exists takusan/baden_cuisine
  touch_file_if_not_exists takusan/baden_cuisine/rehrücken_baden-baden.txt
  touch_file_if_not_exists takusan/baden_cuisine/sulz.txt
  touch_file_if_not_exists takusan/baden_cuisine/egli.txt
  touch_file_if_not_exists takusan/baden_cuisine/schäufele.txt
  touch_file_if_not_exists takusan/baden_cuisine/landjäger.txt
  touch_file_if_not_exists takusan/baden_cuisine/bibbeliskäs.txt
  touch_file_if_not_exists takusan/baden_cuisine/käsespätzle.txt
  touch_file_if_not_exists takusan/baden_cuisine/maultaschen.txt
  touch_file_if_not_exists takusan/baden_cuisine/schupfnudeln.txt
  touch_file_if_not_exists takusan/baden_cuisine/spätzle.txt
  touch_file_if_not_exists takusan/baden_cuisine/rauhbrägeldi.txt
  touch_file_if_not_exists takusan/baden_cuisine/pretzel.txt
  touch_file_if_not_exists takusan/baden_cuisine/kirschenmichel.txt
  touch_file_if_not_exists takusan/baden_cuisine/badischi_schärbe.txt
  touch_file_if_not_exists takusan/baden_cuisine/strübli.txt
  touch_file_if_not_exists takusan/baden_cuisine/ofenschlupfer.txt
  touch_file_if_not_exists takusan/baden_cuisine/scheiterhaufen.txt
  touch_file_if_not_exists takusan/baden_cuisine/wähe.txt
  make_directory_if_not_exists takusan/bavarian_cuisine
  touch_file_if_not_exists takusan/bavarian_cuisine/griebenschmalz.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/eintopf.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/griessnockerlsuppe.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/hochzeitssuppe.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/saures_lüngerl.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/tellerfleisch.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/krustenbraten.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/schweinsbraten.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/schweinshaxe.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/sauerbraten.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/skirt_steak.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/pichelsteiner.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/kalbsvögerl.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/kesselfleisch.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/reiberdatschi.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/fingernudeln.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/schupfnudeln.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/schmalznudeln.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/rohrnudeln.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/schuxen.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/fleischpflanzerl.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/bröselschmarrn.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/suckling_pig.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/gnocchi.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/käsespätzle.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/kartoffelkäse.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/brezel.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/obatzda.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/bratapfel.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/dampfnudel.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/kaiserschmarrn.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/germknödel.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/magenbrot.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/gebrannte_mandeln.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/baumkuchen.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/gugelhupf.txt
  touch_file_if_not_exists takusan/bavarian_cuisine/bienenstich.txt
  make_directory_if_not_exists takusan/belarusian_cuisine
  touch_file_if_not_exists takusan/belarusian_cuisine/каўбаса.txt
  touch_file_if_not_exists takusan/belarusian_cuisine/пальцоўка.txt
  touch_file_if_not_exists takusan/belarusian_cuisine/крывянка.txt
  touch_file_if_not_exists takusan/belarusian_cuisine/крывяная_каўбаса.txt
  touch_file_if_not_exists takusan/belarusian_cuisine/шкалондза.txt
  touch_file_if_not_exists takusan/belarusian_cuisine/кіндзюк.txt
  touch_file_if_not_exists takusan/belarusian_cuisine/паўгускі.txt
  touch_file_if_not_exists takusan/belarusian_cuisine/верашчака.txt
  touch_file_if_not_exists takusan/belarusian_cuisine/мачанка.txt
  touch_file_if_not_exists takusan/belarusian_cuisine/тварог.txt
  make_directory_if_not_exists takusan/estonian_cuisine
  touch_file_if_not_exists takusan/estonian_cuisine/rukkileib.txt
  touch_file_if_not_exists takusan/estonian_cuisine/mannavaht.txt
  touch_file_if_not_exists takusan/estonian_cuisine/kohupiimakreem.txt
  touch_file_if_not_exists takusan/estonian_cuisine/kohuke.txt
  touch_file_if_not_exists takusan/estonian_cuisine/kompott.txt
  touch_file_if_not_exists takusan/estonian_cuisine/kama.txt
  touch_file_if_not_exists takusan/estonian_cuisine/leivasupp.txt
  touch_file_if_not_exists takusan/estonian_cuisine/pannkook.txt
  make_directory_if_not_exists takusan/lithuanian_cuisine
  touch_file_if_not_exists takusan/lithuanian_cuisine/kepta_duona.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/Įdaryti_kiaušiniai.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/Įdaryti_pomidorai.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/piršteliai_prie_alaus.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/lašiniai.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/bulvinių_kukulių_sriuba.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/kopūstienė.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/juka.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/lapiene.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/kankolienė.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/barščiai.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/Šaltibarščiai.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/vištienos_sultinys.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/maltiniai.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/manų_putra.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/Šaltiena.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/blynai.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/balandėliai.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/dešra.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/didžkukuliai.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/kastinys.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/kibinai.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/kukuliai.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/koldūnai.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/Šaltanosiai.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/kugelis.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/Šaltnosiukai.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/skilandis.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/suktiniai.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/Švilpikai.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/Šiupinys.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/troškinti_rauginti_kopūstai.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/vėdarai.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/Žagarėliai.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/kūčiukai.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/ledai.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/spurgos.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/Šakotis.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/Šimtalapis.txt
  touch_file_if_not_exists takusan/lithuanian_cuisine/tinginys.txt
  make_directory_if_not_exists takusan/danish_cuisine
  touch_file_if_not_exists takusan/danish_cuisine/boller_i_karry.txt
  touch_file_if_not_exists takusan/danish_cuisine/gammeldags_kylling.txt
  touch_file_if_not_exists takusan/danish_cuisine/frikadeller.txt
  touch_file_if_not_exists takusan/danish_cuisine/hakkebøf.txt
  touch_file_if_not_exists takusan/danish_cuisine/hjerter_i_flødesovs.txt
  touch_file_if_not_exists takusan/danish_cuisine/stegt_lever.txt
  touch_file_if_not_exists takusan/danish_cuisine/stegte_sild.txt
  touch_file_if_not_exists takusan/danish_cuisine/Æbleflæsk.txt
  touch_file_if_not_exists takusan/danish_cuisine/stegt_flæsk_med_persillesovs.txt
  touch_file_if_not_exists takusan/danish_cuisine/medisterpølse.txt
  touch_file_if_not_exists takusan/danish_cuisine/gule_Ærter.txt
  touch_file_if_not_exists takusan/danish_cuisine/hønsekødssuppe.txt
  touch_file_if_not_exists takusan/danish_cuisine/høns_i_asparges.txt
  touch_file_if_not_exists takusan/danish_cuisine/tarteletter.txt
  touch_file_if_not_exists takusan/danish_cuisine/Æggekage.txt
  touch_file_if_not_exists takusan/danish_cuisine/påskelam.txt
  touch_file_if_not_exists takusan/danish_cuisine/culottesteg.txt
  touch_file_if_not_exists takusan/danish_cuisine/stegt_gås.txt
  touch_file_if_not_exists takusan/danish_cuisine/flæskesteg.txt
  touch_file_if_not_exists takusan/danish_cuisine/rødkål.txt
  touch_file_if_not_exists takusan/danish_cuisine/brunede_kartofler.txt
  touch_file_if_not_exists takusan/danish_cuisine/Øllebrød.txt
  touch_file_if_not_exists takusan/danish_cuisine/millionbøf.txt
  touch_file_if_not_exists takusan/danish_cuisine/brændende_kærlighed.txt
  touch_file_if_not_exists takusan/danish_cuisine/risengrød.txt
  make_directory_if_not_exists takusan/finnish_cuisine
  touch_file_if_not_exists takusan/finnish_cuisine/kaalikääryleet.txt
  touch_file_if_not_exists takusan/finnish_cuisine/game.txt
  touch_file_if_not_exists takusan/finnish_cuisine/hernekeitto.txt
  touch_file_if_not_exists takusan/finnish_cuisine/leipäjuusto.txt
  touch_file_if_not_exists takusan/finnish_cuisine/viili.txt
  touch_file_if_not_exists takusan/finnish_cuisine/perunamuusi.txt
  touch_file_if_not_exists takusan/finnish_cuisine/lihapullat.txt
  touch_file_if_not_exists takusan/finnish_cuisine/palvikinkku.txt
  touch_file_if_not_exists takusan/finnish_cuisine/palviliha.txt
  touch_file_if_not_exists takusan/finnish_cuisine/hernekeitto.txt
  touch_file_if_not_exists takusan/finnish_cuisine/laskiaispulla.txt
  touch_file_if_not_exists takusan/finnish_cuisine/mämmi.txt
  touch_file_if_not_exists takusan/finnish_cuisine/pasha.txt
  touch_file_if_not_exists takusan/finnish_cuisine/sima.txt
  touch_file_if_not_exists takusan/finnish_cuisine/munkki.txt
  touch_file_if_not_exists takusan/finnish_cuisine/joulupöytä.txt
  make_directory_if_not_exists takusan/swedish_cuisine
  touch_file_if_not_exists takusan/swedish_cuisine/Ärtsoppa.txt
  touch_file_if_not_exists takusan/swedish_cuisine/blåbärspalt.txt
  touch_file_if_not_exists takusan/swedish_cuisine/blodpalt.txt
  touch_file_if_not_exists takusan/swedish_cuisine/blodpudding.txt
  touch_file_if_not_exists takusan/swedish_cuisine/blodkorv.txt
  touch_file_if_not_exists takusan/swedish_cuisine/bruna_bönor_och_fläsk.txt
  touch_file_if_not_exists takusan/swedish_cuisine/falukorv.txt
  touch_file_if_not_exists takusan/swedish_cuisine/fiskbullar.txt
  touch_file_if_not_exists takusan/swedish_cuisine/fläskkorv.txt
  touch_file_if_not_exists takusan/swedish_cuisine/fläskpannkaka.txt
  touch_file_if_not_exists takusan/swedish_cuisine/flygande_jacob.txt
  touch_file_if_not_exists takusan/swedish_cuisine/gravlax.txt
  touch_file_if_not_exists takusan/swedish_cuisine/grisfötter.txt
  touch_file_if_not_exists takusan/swedish_cuisine/inkokt_lax.txt
  touch_file_if_not_exists takusan/swedish_cuisine/inlagd_sill.txt
  touch_file_if_not_exists takusan/swedish_cuisine/isterband.txt
  touch_file_if_not_exists takusan/swedish_cuisine/janssons_frestelse.txt
  touch_file_if_not_exists takusan/swedish_cuisine/julskinka.txt
  touch_file_if_not_exists takusan/swedish_cuisine/kåldolmar.txt
  touch_file_if_not_exists takusan/swedish_cuisine/kalops.txt
  touch_file_if_not_exists takusan/swedish_cuisine/köttbullar.txt
  touch_file_if_not_exists takusan/swedish_cuisine/korv_stroganoff.txt
  touch_file_if_not_exists takusan/swedish_cuisine/köttsoppa_med_klimp.txt
  touch_file_if_not_exists takusan/swedish_cuisine/kroppkakor.txt
  touch_file_if_not_exists takusan/swedish_cuisine/leverpalt.txt
  touch_file_if_not_exists takusan/swedish_cuisine/lutfist.txt
  touch_file_if_not_exists takusan/swedish_cuisine/palt.txt
  touch_file_if_not_exists takusan/swedish_cuisine/paltbröd.txt
  touch_file_if_not_exists takusan/swedish_cuisine/pannkakor.txt
  touch_file_if_not_exists takusan/swedish_cuisine/pitepalt.txt
  touch_file_if_not_exists takusan/swedish_cuisine/plättar.txt
  touch_file_if_not_exists takusan/swedish_cuisine/pölsa.txt
  touch_file_if_not_exists takusan/swedish_cuisine/prinskorv.txt
  touch_file_if_not_exists takusan/swedish_cuisine/pyttipanna.txt
  touch_file_if_not_exists takusan/swedish_cuisine/raggmunk.txt
  touch_file_if_not_exists takusan/swedish_cuisine/räksmörgås.txt
  touch_file_if_not_exists takusan/swedish_cuisine/sillsallad.txt
  touch_file_if_not_exists takusan/swedish_cuisine/smörgåstårta.txt
  touch_file_if_not_exists takusan/swedish_cuisine/s.o.s..txt
  touch_file_if_not_exists takusan/swedish_cuisine/stekt_strömming.txt
  touch_file_if_not_exists takusan/swedish_cuisine/surströmming.txt
  touch_file_if_not_exists takusan/swedish_cuisine/sylta.txt
  touch_file_if_not_exists takusan/swedish_cuisine/wallenbergare.txt
  make_directory_if_not_exists takusan/bosnia_and_herzegovina_cuisine
  touch_file_if_not_exists takusan/bosnia_and_herzegovina_cuisine/Ćevapi.txt
  touch_file_if_not_exists takusan/bosnia_and_herzegovina_cuisine/pljeskavica.txt
  touch_file_if_not_exists takusan/bosnia_and_herzegovina_cuisine/begova_Čorba.txt
  touch_file_if_not_exists takusan/bosnia_and_herzegovina_cuisine/punjena_paprika.txt
  touch_file_if_not_exists takusan/bosnia_and_herzegovina_cuisine/sogan-dolma.txt
  touch_file_if_not_exists takusan/bosnia_and_herzegovina_cuisine/Ćufte.txt
  touch_file_if_not_exists takusan/bosnia_and_herzegovina_cuisine/pilav.txt
  touch_file_if_not_exists takusan/bosnia_and_herzegovina_cuisine/burek.txt
  touch_file_if_not_exists takusan/bosnia_and_herzegovina_cuisine/sarma.txt
  touch_file_if_not_exists takusan/bosnia_and_herzegovina_cuisine/grah.txt
  touch_file_if_not_exists takusan/bosnia_and_herzegovina_cuisine/bosanski_lonac.txt
  touch_file_if_not_exists takusan/bosnia_and_herzegovina_cuisine/tarhana.txt
  touch_file_if_not_exists takusan/bosnia_and_herzegovina_cuisine/sudžuk.txt
  touch_file_if_not_exists takusan/bosnia_and_herzegovina_cuisine/suho_meso.txt
  touch_file_if_not_exists takusan/bosnia_and_herzegovina_cuisine/Đuveč.txt
  touch_file_if_not_exists takusan/bosnia_and_herzegovina_cuisine/kačamak.txt
  touch_file_if_not_exists takusan/bosnia_and_herzegovina_cuisine/kljukuša.txt
  touch_file_if_not_exists takusan/bosnia_and_herzegovina_cuisine/sataraš.txt
  touch_file_if_not_exists takusan/bosnia_and_herzegovina_cuisine/meze.txt
  touch_file_if_not_exists takusan/bosnia_and_herzegovina_cuisine/baklava.txt
  touch_file_if_not_exists takusan/bosnia_and_herzegovina_cuisine/halva.txt
  touch_file_if_not_exists takusan/bosnia_and_herzegovina_cuisine/hurmašica.txt
  touch_file_if_not_exists takusan/bosnia_and_herzegovina_cuisine/rahatlokum.txt
  make_directory_if_not_exists takusan/bulgarian_cuisine
  touch_file_if_not_exists takusan/bulgarian_cuisine/tarator.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/nettle_soup.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/lentil_soup.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/teleshko_vareno.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/ribena_chorba.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/topcheta_soup.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/kurban_chorba.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/pacha.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/shkembe_chorba.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/smilyanski_fasul.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/ghivetch.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/ovcharska_salata.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/ruska_salata.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/shopska_salad.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/snezhanka.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/turshiya.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/lyutenitsa.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/kyopulu.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/podluchen_sauce.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/katino_meze.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/drob_po_selski.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/ezik_v_maslo.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/sirene_pane.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/kashkaval_pane.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/kyufte.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/kebapche.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/parjola.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/shishcheta.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/karnache.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/nadenitsa.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/tatarsko_kyufte.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/nevrozno_kyufte.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/cheverme.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/meshana_skara.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/ghivetch.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/yahniya.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/plakiya.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/sarma.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/drob_sarma.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/kavarma.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/kapama.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/mish-mash.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/pilaf.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/moussaka.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/chomlek.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/mlin.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/pita.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/fish_zelnik.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/pogača.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/kravai.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/kolach.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/banitsa.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/tikvenik.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/zelnik.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/baklava.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/saraliya.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/parlenki.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/patatnik.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/kačamak.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/byal_mazh.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/tutmanik.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/milinka.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/gevrek.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/kozunak.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/mekitsi.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/marudnitsi.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/katmi.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/palachinki.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/langidi.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/tiganitsi.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/dubnik.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/popara.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/sulovar.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/parjeni_filii.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/solenki.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/trienitsa.txt
  touch_file_if_not_exists takusan/bulgarian_cuisine/trahana.txt
  make_directory_if_not_exists takusan/romani_cuisine
  touch_file_if_not_exists takusan/romani_cuisine/saviako.txt
  touch_file_if_not_exists takusan/romani_cuisine/gushvada.txt
  touch_file_if_not_exists takusan/romani_cuisine/Çingene_yumurtasi.txt
  touch_file_if_not_exists takusan/romani_cuisine/Çingene_tavuğu.txt
  touch_file_if_not_exists takusan/romani_cuisine/shak_te_mas.txt
  touch_file_if_not_exists takusan/romani_cuisine/joe_grey.txt
  touch_file_if_not_exists takusan/romani_cuisine/bodag.txt
  touch_file_if_not_exists takusan/romani_cuisine/vegyes_nyakleves.txt
  touch_file_if_not_exists takusan/romani_cuisine/bokoli.txt
  touch_file_if_not_exists takusan/romani_cuisine/boranija.txt
  touch_file_if_not_exists takusan/romani_cuisine/cignidaki_zumi.txt
  touch_file_if_not_exists takusan/romani_cuisine/djeveli.csv
  touch_file_if_not_exists takusan/romani_cuisine/djuveci.txt
  touch_file_if_not_exists takusan/romani_cuisine/galuski.txt
  touch_file_if_not_exists takusan/romani_cuisine/guvara.txt
  touch_file_if_not_exists takusan/romani_cuisine/hočiwiči.txt
  touch_file_if_not_exists takusan/romani_cuisine/jaxnija.txt
  touch_file_if_not_exists takusan/romani_cuisine/manrro_la_smetanasa.txt
  touch_file_if_not_exists takusan/romani_cuisine/muterdo_sax.txt
  touch_file_if_not_exists takusan/romani_cuisine/peržala.txt
  touch_file_if_not_exists takusan/romani_cuisine/pirožna_makoske_semincjansa.txt
  touch_file_if_not_exists takusan/romani_cuisine/poovengur_drey_a_koori.txt
  touch_file_if_not_exists takusan/romani_cuisine/pufe.txt
  touch_file_if_not_exists takusan/romani_cuisine/rrunza.txt
  touch_file_if_not_exists takusan/romani_cuisine/romano_cajo.txt
  touch_file_if_not_exists takusan/romani_cuisine/sonko_fusujansa.txt
  touch_file_if_not_exists takusan/romani_cuisine/sax_suklo.txt
  touch_file_if_not_exists takusan/romani_cuisine/xevica.txt
  make_directory_if_not_exists takusan/catalan_cuisine
  touch_file_if_not_exists takusan/catalan_cuisine/escalivada.txt
  touch_file_if_not_exists takusan/catalan_cuisine/escudella.txt
  touch_file_if_not_exists takusan/catalan_cuisine/fricandó.txt
  touch_file_if_not_exists takusan/catalan_cuisine/ollada.txt
  touch_file_if_not_exists takusan/catalan_cuisine/esqueixada.txt
  touch_file_if_not_exists takusan/catalan_cuisine/tonyina_en_escabetx.txt
  touch_file_if_not_exists takusan/catalan_cuisine/allioli.txt
  touch_file_if_not_exists takusan/catalan_cuisine/samfaina.txt
  touch_file_if_not_exists takusan/catalan_cuisine/crema_catalana.txt
  make_directory_if_not_exists takusan/greek_cuisine
  touch_file_if_not_exists takusan/greek_cuisine/kalamarakia_tiganita.txt
  touch_file_if_not_exists takusan/greek_cuisine/kolokithokeftedes.txt
  touch_file_if_not_exists takusan/greek_cuisine/bourekakia.txt
  touch_file_if_not_exists takusan/greek_cuisine/tirokroketes.txt
  touch_file_if_not_exists takusan/greek_cuisine/marides_tiganites.txt
  touch_file_if_not_exists takusan/greek_cuisine/skordopsomo.txt
  touch_file_if_not_exists takusan/greek_cuisine/tiropita.txt
  touch_file_if_not_exists takusan/greek_cuisine/dakos.txt
  touch_file_if_not_exists takusan/greek_cuisine/piroski.txt
  touch_file_if_not_exists takusan/greek_cuisine/horiatiki_salad.txt
  touch_file_if_not_exists takusan/greek_cuisine/horta_salad.txt
  touch_file_if_not_exists takusan/greek_cuisine/pikantiki.txt
  touch_file_if_not_exists takusan/greek_cuisine/ampelofasoula.txt
  touch_file_if_not_exists takusan/greek_cuisine/kounoupidi.txt
  touch_file_if_not_exists takusan/greek_cuisine/patatosalata.txt
  touch_file_if_not_exists takusan/greek_cuisine/aggouro-ntomata.txt
  touch_file_if_not_exists takusan/greek_cuisine/maroulosalata.txt
  touch_file_if_not_exists takusan/greek_cuisine/hummus.csv
  touch_file_if_not_exists takusan/greek_cuisine/kipourou.txt
  touch_file_if_not_exists takusan/greek_cuisine/rosiki.csv
  touch_file_if_not_exists takusan/greek_cuisine/skordalia.txt
  touch_file_if_not_exists takusan/greek_cuisine/tirokafteri.txt
  touch_file_if_not_exists takusan/greek_cuisine/tzatziki.txt
  touch_file_if_not_exists takusan/greek_cuisine/fasolada.txt
  touch_file_if_not_exists takusan/greek_cuisine/fakes.txt
  touch_file_if_not_exists takusan/greek_cuisine/kotosoupa.txt
  touch_file_if_not_exists takusan/greek_cuisine/kremidosoupa.txt
  touch_file_if_not_exists takusan/greek_cuisine/kreatosoupa.txt
  touch_file_if_not_exists takusan/greek_cuisine/kakavia.csv
  touch_file_if_not_exists takusan/greek_cuisine/magiritsa.txt
  touch_file_if_not_exists takusan/greek_cuisine/ntomatosoupa.txt
  touch_file_if_not_exists takusan/greek_cuisine/patsas.txt
  touch_file_if_not_exists takusan/greek_cuisine/revithosoupa.csv
  touch_file_if_not_exists takusan/greek_cuisine/trahanas.txt
  touch_file_if_not_exists takusan/greek_cuisine/xilos.txt
  touch_file_if_not_exists takusan/greek_cuisine/agkinares.txt
  touch_file_if_not_exists takusan/greek_cuisine/fasolakia.txt
  touch_file_if_not_exists takusan/greek_cuisine/arakas.txt
  touch_file_if_not_exists takusan/greek_cuisine/bamies.txt
  touch_file_if_not_exists takusan/greek_cuisine/briam.txt
  touch_file_if_not_exists takusan/greek_cuisine/gemista.txt
  touch_file_if_not_exists takusan/greek_cuisine/stifado.txt
  touch_file_if_not_exists takusan/greek_cuisine/kolokithakia_gemista.txt
  touch_file_if_not_exists takusan/greek_cuisine/spetsofai.txt
  touch_file_if_not_exists takusan/greek_cuisine/gyros.txt
  touch_file_if_not_exists takusan/greek_cuisine/hilopites.txt
  touch_file_if_not_exists takusan/greek_cuisine/bourdeto.txt
  touch_file_if_not_exists takusan/greek_cuisine/kleftiko.txt
  touch_file_if_not_exists takusan/greek_cuisine/keftedakia.txt
  touch_file_if_not_exists takusan/greek_cuisine/mousakas.txt
  touch_file_if_not_exists takusan/greek_cuisine/fanouropita.txt
  make_directory_if_not_exists takusan/belgian_cuisine
  touch_file_if_not_exists takusan/belgian_cuisine/tartines.txt
  touch_file_if_not_exists takusan/belgian_cuisine/garnaalkroketten.txt
  touch_file_if_not_exists takusan/belgian_cuisine/luikse_salade.txt
  touch_file_if_not_exists takusan/belgian_cuisine/tomaat-garnaal.txt
  touch_file_if_not_exists takusan/belgian_cuisine/moules-frites.txt
  touch_file_if_not_exists takusan/belgian_cuisine/vlaamse_karbonaden.txt
  touch_file_if_not_exists takusan/belgian_cuisine/biefstuk_met_friet.txt
  touch_file_if_not_exists takusan/belgian_cuisine/waterzooi.txt
  touch_file_if_not_exists takusan/belgian_cuisine/gegratineerd_witloof.txt
  touch_file_if_not_exists takusan/belgian_cuisine/kip_met_frieten_en_appelmoes.txt
  touch_file_if_not_exists takusan/belgian_cuisine/boudin.txt
  touch_file_if_not_exists takusan/belgian_cuisine/stoemp.txt
  touch_file_if_not_exists takusan/belgian_cuisine/vol-au-vent.txt
  touch_file_if_not_exists takusan/belgian_cuisine/lokerse_paardenworst.txt
  touch_file_if_not_exists takusan/belgian_cuisine/gaufres.txt
  touch_file_if_not_exists takusan/belgian_cuisine/croustillons.txt
  touch_file_if_not_exists takusan/belgian_cuisine/rijstevlaai.txt
  touch_file_if_not_exists takusan/belgian_cuisine/cuberdon.txt
  touch_file_if_not_exists takusan/belgian_cuisine/lacquements.txt
  touch_file_if_not_exists takusan/belgian_cuisine/aalsterse_vlaai.txt
  make_directory_if_not_exists takusan/basque_cuisine
  touch_file_if_not_exists takusan/basque_cuisine/bacalao.txt
  touch_file_if_not_exists takusan/basque_cuisine/elvers.txt
  touch_file_if_not_exists takusan/basque_cuisine/kokotxas.txt
  touch_file_if_not_exists takusan/basque_cuisine/marmitako.txt
  touch_file_if_not_exists takusan/basque_cuisine/percebes.txt
  touch_file_if_not_exists takusan/basque_cuisine/pintxos.txt
  touch_file_if_not_exists takusan/basque_cuisine/piperade.txt
  touch_file_if_not_exists takusan/basque_cuisine/pisto.txt
  touch_file_if_not_exists takusan/basque_cuisine/porrusalda.txt
  touch_file_if_not_exists takusan/basque_cuisine/talos.txt
  touch_file_if_not_exists takusan/basque_cuisine/ttoro.txt
  touch_file_if_not_exists takusan/basque_cuisine/txangurro.txt
  touch_file_if_not_exists takusan/basque_cuisine/txipirones.txt
  touch_file_if_not_exists takusan/basque_cuisine/txuleta.txt
  touch_file_if_not_exists takusan/basque_cuisine/cuajada.txt
  touch_file_if_not_exists takusan/basque_cuisine/biskotx.txt
  touch_file_if_not_exists takusan/basque_cuisine/goxua.txt
  touch_file_if_not_exists takusan/basque_cuisine/ntxaursaltsa.txt
  make_directory_if_not_exists takusan/fijian_cuisine
  touch_file_if_not_exists takusan/fijian_cuisine/fish_suruwa.txt
  touch_file_if_not_exists takusan/fijian_cuisine/kokoda.txt
  touch_file_if_not_exists takusan/fijian_cuisine/lovo.txt
  touch_file_if_not_exists takusan/fijian_cuisine/palusami.txt
  touch_file_if_not_exists takusan/fijian_cuisine/rourou.txt
  touch_file_if_not_exists takusan/fijian_cuisine/fijian_mud_cake.txt
  touch_file_if_not_exists takusan/fijian_cuisine/fijian_mud_pie.txt
  touch_file_if_not_exists takusan/fijian_cuisine/purini.txt
  touch_file_if_not_exists takusan/fijian_cuisine/tavioka.txt
  touch_file_if_not_exists takusan/fijian_cuisine/vakalavalava.txt
  touch_file_if_not_exists takusan/fijian_cuisine/vakalolo.txt
  make_directory_if_not_exists takusan/mariana_islands_cuisine
  touch_file_if_not_exists takusan/mariana_islands_cuisine/buñelos_uhang.txt
  touch_file_if_not_exists takusan/mariana_islands_cuisine/chalakiles.txt
  touch_file_if_not_exists takusan/mariana_islands_cuisine/chamorro_red_rice.txt
  touch_file_if_not_exists takusan/mariana_islands_cuisine/estufao.txt
  touch_file_if_not_exists takusan/mariana_islands_cuisine/guyuria.txt
  touch_file_if_not_exists takusan/mariana_islands_cuisine/fina\'denni\'.txt
  touch_file_if_not_exists takusan/mariana_islands_cuisine/kåddun_pika.txt
  touch_file_if_not_exists takusan/mariana_islands_cuisine/kalamai.txt
  touch_file_if_not_exists takusan/mariana_islands_cuisine/kelaguen.txt
  touch_file_if_not_exists takusan/mariana_islands_cuisine/latiya.txt
  touch_file_if_not_exists takusan/mariana_islands_cuisine/rosketti.txt
  touch_file_if_not_exists takusan/mariana_islands_cuisine/tinaktak.txt
  touch_file_if_not_exists takusan/mariana_islands_cuisine/apigigi.txt
  make_directory_if_not_exists takusan/hawaiian_cuisine
  touch_file_if_not_exists takusan/hawaiian_cuisine/chicken_long_rice.txt
  touch_file_if_not_exists takusan/hawaiian_cuisine/kalua_pig.txt
  touch_file_if_not_exists takusan/hawaiian_cuisine/crack_seed.txt
  touch_file_if_not_exists takusan/hawaiian_cuisine/laulau.txt
  touch_file_if_not_exists takusan/hawaiian_cuisine/loco_moco.txt
  touch_file_if_not_exists takusan/hawaiian_cuisine/lomi_salmon.txt
  touch_file_if_not_exists takusan/hawaiian_cuisine/luau.txt
  touch_file_if_not_exists takusan/hawaiian_cuisine/malasada.txt
  touch_file_if_not_exists takusan/hawaiian_cuisine/manapua.txt
  touch_file_if_not_exists takusan/hawaiian_cuisine/mochi.txt
  touch_file_if_not_exists takusan/hawaiian_cuisine/musubi-rice_balls.txt
  touch_file_if_not_exists takusan/hawaiian_cuisine/opihi.txt
  touch_file_if_not_exists takusan/hawaiian_cuisine/pasteles.txt
  touch_file_if_not_exists takusan/hawaiian_cuisine/plate_lunch.txt
  touch_file_if_not_exists takusan/hawaiian_cuisine/poi.txt
  touch_file_if_not_exists takusan/hawaiian_cuisine/saimin.txt
  touch_file_if_not_exists takusan/hawaiian_cuisine/kava.txt
  make_directory_if_not_exists takusan/tongan_cuisine
  touch_file_if_not_exists takusan/tongan_cuisine/lū.txt
  touch_file_if_not_exists takusan/tongan_cuisine/\'otai.txt
  touch_file_if_not_exists takusan/tongan_cuisine/\'ota_ika.txt
  touch_file_if_not_exists takusan/tongan_cuisine/vai_siaine.txt
  make_directory_if_not_exists takusan/monégasque_cuisine
  touch_file_if_not_exists takusan/monégasque_cuisine/anchoiade.txt
  touch_file_if_not_exists takusan/monégasque_cuisine/barbagiuan.txt
  touch_file_if_not_exists takusan/monégasque_cuisine/beignets_de_fleurs_de_courgette.txt
  touch_file_if_not_exists takusan/monégasque_cuisine/bouillabaisse.txt
  touch_file_if_not_exists takusan/monégasque_cuisine/brandaminciun.txt
  touch_file_if_not_exists takusan/monégasque_cuisine/florentines.txt
  touch_file_if_not_exists takusan/monégasque_cuisine/fougasse.txt
  touch_file_if_not_exists takusan/monégasque_cuisine/fraises_de_bois_au_vin_rouge.txt
  touch_file_if_not_exists takusan/monégasque_cuisine/pan-bagnat.txt
  touch_file_if_not_exists takusan/monégasque_cuisine/pasqualina.txt
  touch_file_if_not_exists takusan/monégasque_cuisine/pissaladière.txt
  touch_file_if_not_exists takusan/monégasque_cuisine/rougets_à_la_niçoise.txt
  touch_file_if_not_exists takusan/monégasque_cuisine/salade_niçoise.txt
  touch_file_if_not_exists takusan/monégasque_cuisine/socca.txt
  touch_file_if_not_exists takusan/monégasque_cuisine/soup_aux_moules.txt
  touch_file_if_not_exists takusan/monégasque_cuisine/soupe_de_pistou.txt
  touch_file_if_not_exists takusan/monégasque_cuisine/stocafi.txt
  touch_file_if_not_exists takusan/monégasque_cuisine/tarte_au_citron.txt
  touch_file_if_not_exists takusan/monégasque_cuisine/tourte_de_blette.txt
  touch_file_if_not_exists takusan/monégasque_cuisine/u_pan_de_natale.txt
}

function make_takusan_files() {
  make_directory_if_not_exists asia
  make_directory_if_not_exists asia/japan
  echo -e "Major Island: Hokkaidō\nRegion: Hokkaidō\nCapital: Sapporo\nISO: 3166-2:JP-01\nArea code: 011-016\nBird: Tanchō\nFlower: Hamanasu\nTree: Ezomatsu\nMunicipalities: Sapporo, Otaru, Wakkanai, Abashiri, Kitami, Asahikawa, Obihiro, Kushiro, Tomakomai, Hakodate" > asia/japan/hokkaido.txt
  echo -e "Major Island: Honshū\nRegion: Tōhoku\nCapital: Aomori\nISO: 3166-2:JP-02\nArea code: 017\nBird: Bewick's swan\nFlower: Apple blossom\nTree: Hiba\nMunicipalities: Aomori, Hirosaki, Hachinohe, Mutsu" > asia/japan/aomori.txt
  echo -e "Major Island: Honshū\nRegion: Tōhoku\nCapital: Morioka\nISO: 3166-2:JP-03\nArea code: 019\nBird: Green phesant\nFlower: Paulownia tree\nTree: Nanbu red pine\nMunicipalities: Morioka, Ōushū, Hanamaki, Ichinoseki, Kamaishi, Kitakami, Miyako" > asia/japan/iwate.txt
  echo -e "Major Island: Honshū\nRegion: Tōhoku\nCapital: Sendai\nISO: 3166-2:JP-04\nArea code: 022\nBird: Wild goose\nFlower: Miyagi bush clover\nTree: Japanese zelkova\nMunicipalities: Sendai, Ishinomaki, Furukawa, Kesennuma, Shiroishi" > asia/japan/miyagi.txt
  echo -e "Major Island: Honshū\nRegion: Tōhoku\nCapital: Akita\nISO: 3166-2:JP-05\nArea code: 018\nBird: Copper phesant\nFlower: Fuki\nTree: Akita-sugi\nMunicipalities: Noshiro, Yokote, Ōdate, Yurihonjō" > asia/japan/akita.txt
  echo -e "Major Island: Honshū\nRegion: Tōhoku\nCapital: Yamagata\nISO: 3166-2:JP-06\nArea code: 023\nBird: Mandarin duck\nFlower: Safflower\nTree: Cherry\nMunicipalities: Yamagata, Yonezawa, Tsuruoka, Sakata" > asia/japan/yamagata.txt
  echo -e "Major Island: Honshū\nRegion: Tōhoku\nCapital: Fukushima\nISO: 3166-2:JP-07\nArea code: 024\nBird: Narcissus flycathcer\nFlower: Nemotoshakunage\nTree: Japanese zelkova\nMunicipalities: Fukushima, Aizuwakamatsu, Kōriyama, Iwaki" > asia/japan/fukushima.txt
  echo -e "Major Island: Honshū\nRegion: Kantō\nCapital: Mito\nISO: 3166-2:JP-08\nArea code: 029\nBird: Eurasian Skylark\nFlower: Rose\nTree: Ume tree\nMunicipalities: Mito, Hitachi, Tuchiura, Tsukuba, Hitachinaka" > asia/japan/ibaraki.txt
  echo -e "Major Island: Honshū\nRegion: Kantō\nCapital: Utsunomiya\nISO: 3166-2:JP-09\nArea code: 028\nBird: Blue-and-white flycatcher\nFlower: Yashio tsutsuji\nTree: Japanese horse chestnut\nMunicipalities: Utsunomiya, Oyama, Ashikaga, Tochigi" > asia/japan/tochigi.txt
  echo -e "Major Island: Honshū\nRegion: Kantō\nCapital: Maebashi\nISO: 3166-2:JP-10\nArea code: 027\nBird: Copper phesant\nFlower: Japanese azalea\nTree: Japanese black pine\nMunicipalities: Maebashi, Takasaki, Isesaki, Ōta" > asia/japan/gumma.txt
  echo -e "Major Island: Honshū\nRegion: Kantō\nCapital: Saitama\nISO: 3166-2:JP-11\nArea code: 048\nBird: Eurasian collared dove\nFlower: Primrose\nTree: Keyaki\nMunicipalities: Kawaguchi, Kawagoe, Koshigaya, Tokorozawa" > asia/japan/saitama.txt
  echo -e "Major Island: Honshū\nRegion: Kantō\nCapital: Chiba\nISO: 3166-2:JP-12\nArea code: 043\nBird: Meadow bunting\nFlower: Seiyō aburana blossom\nTree: Kusamaki\nMunicipalities: Chiba, Ichikawa, Funabashi, Matsudo, Kashiwa" > asia/japan/chiba.txt
  echo -e "Major Island: Honshū\nRegion: Kantō\nCapital: Shinjuku\nISO: 3166-2:JP-13\nArea code: 03x/042\nBird: Black-headed gull\nFlower: Yoshino cherry\nTree: Ginkgo\nMunicipalities: Ōta, Setagaya, Adachi, Hachiuōji" > asia/japan/tokyo.txt
  echo -e "Major Island: Honshū\nRegion: Kantō\nCapital: Yokohama\nISO: 3166-2:JP-14\nArea code: 045\nBird: Common gull\nFlower: Golden-rayed lily\nTree: Ginkgo\nMunicipalities: Yokohama, Kawasaki, Sagamihara, Fujisawa, Yokosuka" > asia/japan/kanagawa.txt
  echo -e "Major Island: Honshū\nRegion: Chūbu\nCapital: Niigata\nISO: 3166-2:JP-15\nArea code: 025\nBird: Crested ibis\nFlower: Tulip\nTree: Camellia\nMunicipalities: Niigata, Nagaoka, Jōetsu, Sanjō" > asia/japan/nīgata.txt
  echo -e "Major Island: Honshū\nRegion: Chūbu\nCapital: Toyama\nISO: 3166-2:JP-16\nArea code: 076\nBird: Ptarmigan\nFlower: Tulip\nTree: Tateyama Cedar\nMunicipalities: Toyama, Takaoka, Imidsu, Tonami" > asia/japan/toyama.txt
  echo -e "Major Island: Honshū\nRegion: Chūbu\nCapital: Kanazawa\nISO: 3166-2:JP-17\nArea code: 076\nBird: Golden eagle\nFlower: Black lily\nTree: Hiba\nMunicipalities: Kanazawa, Wajima, Hakusan, Kaga" > asia/japan/ishikawa.txt
  echo -e "Major Island: Honshū\nRegion: Chūbu\nCapital: Fukui\nISO: 3166-2:JP-18\nArea code: 077\nBird: Dusky thrush\nFlower: Narcissus\nTree: Pine tree\nMunicipalities: Fukui, Sakai, Sabae, Echizen" > asia/japan/fukui.txt
  echo -e "Major Island: Honshū\nRegion: Chūbu\nCapital: Kōfu\nISO: 3166-2:JP-19\nArea code: 055\nBird: Uguisu\nFlower: Fujizakura\nTree: Kaede\nMunicipalities: Kōfu, Kai, Minamiarupusu, Fuefuki" > asia/japan/yamanashi.txt
  echo -e "Major Island: Honshū\nRegion: Chūbu\nCapital: Nagano\nISO: 3166-2:JP-20\nArea code: 026\nBird: Rock ptarmigan\nFlower: Gentian\nTree: White birch\nMunicipalities: Nagano, Matsumoto, Ueda, Īda, Azumino" > asia/japan/nagano.txt
  echo -e "Major Island: Honshū\nRegion: Chūbu\nCapital: Gifu\nISO: 3166-2:JP-21\nArea code: 058\nBird: Rock ptarmigan\nFlower: Chinese milk vetch\nTree: Japanese yew\nMunicipalities: Gifu, Ōgaki, Kakamigahara, Tazimi, Kani" > asia/japan/gifu.txt
  echo -e "Major Island: Honshū\nRegion: Chūbu\nCapital: Shizuoka\nISO: 3166-2:JP-22\nArea code: 054\nBird: Japanese paradise flycatcher\nFlower: Azalea\nTree: Sweet osmanthus\nMunicipalities: Shizuoka, Hamamatsu, Fuji, Numazu, Iwata" > asia/japan/shizuoka.txt
  echo -e "Major Island: Honshū\nRegion: Chūbu\nCapital: Nagoya\nISO: 3166-2:JP-23\nArea code: 052\nBird: Oriental scops owl\nFlower: Kakitsubata\nTree: Hananoki\nMunicipalities: Nagoya, Toyota, Okazaki, Toyohashi" > asia/japan/aichi.txt
  echo -e "Major Island: Honshū\nRegion: Kansai\nCapital: Tsu\nISO: 3166-2:JP-24\nArea code: 059\nBird: Snowy plover\nFlower: Iris\nTree: Japanese cedar\nMunicipalities: Tsu, Yokkaichi, Suzuka, Matsusaka, Kuwana" > asia/japan/mie.txt
  echo -e "Major Island: Honshū\nRegion: Kansai\nCapital: Ōtsu\nISO: 3166-2:JP-25\nArea code: 077\nBird: Little grebe\nFlower: Rhododendron\nTree: Japanese maple\nMunicipalities: Ōtsu, Kusatsu, Higashiōmi, Hikone" > asia/japan/shiga.txt
  echo -e "Major Island: Honshū\nRegion: Kansai\nCapital: Kyōto\nISO: 3166-2:JP-26\nArea code: 075\nBird: Streaked shearwater\nFlower: Weeping cherry blossom\nTree: Kitayama Sugi\nMunicipalities: Kyōto, Uzhi, Nagaokakyō, Kizukawa" > asia/japan/kyoto.txt
  echo -e "Major Island: Honshū\nRegion: Kansai\nCapital: Ōsaka\nISO: 3166-2:JP-27\nArea code: 06x\nBird: Bull-headed shrike\nFlower: Japanese apricot\nTree: Ginkgo tree\nMunicipalities: Ōsaka, Sakai, Toyonaka, Suita, Takatsuki" > asia/japan/ōsaka.txt
  echo -e "Major Island: Honshū\nRegion: Kansai\nCapital: Kōbe\nISO: 3166-2:JP-28\nArea code: 073\nBird: Oriental white stork\nFlower: Nojigiku\nTree: Camphor tree\nMunicipalities: Kōbe, Himeji, Nishinomiya, Kakogawa, Takarazuka" > asia/japan/hyōgo.txt
  echo -e "Major Island: Honshū\nRegion: Kansai\nCapital: Nara\nISO: 3166-2:JP-29\nArea code: 074\nBird: Japanese robin\nFlower: Nara yae zakura\nTree: Sugi\nMunicipalities: Nara, Kashihara, Ikoma, Yamatokōriyama" > asia/japan/nara.txt
  echo -e "Major Island: Honshū\nRegion: Kansai\nCapital: Wakayama\nISO: 3166-2:JP-30\nArea code: 075\nBird: Japanese white-eye\nFlower: Ume blossom\nTree: Ubame oak\nMunicipalities: Wakayama, Tanabe, Kinokawa, Hashimoto, Iwade" > asia/japan/wakayama.txt
  echo -e "Major Island: Honshū\nRegion: Chūgoku\nCapital: Tottori\nISO: 3166-2:JP-31\nArea code: 085\nBird: Mandarin duck\nFlower: Nijusseiki nashi pear\nTree: Daisenkyaraboku\nMunicipalities: Tottori, Yonago, Kurayoshi, Sakaiminato" > asia/japan/tottori.txt
  echo -e "Major Island: Honshū\nRegion: Chūgoku\nCapital: Matsue\nISO: 3166-2:JP-32\nArea code: 085\nBird: Whooper swan\nFlower: Moutan peony\nTree: Japanese black pine\nMunicipalities: Izumo, Hamada, Masuda" > asia/japan/shimane.txt
  echo -e "Major Island: Honshū\nRegion: Chūgoku\nCapital: Okayama\nISO: 3166-2:JP-33\nArea code: 086\nBird: Lesser cuckoo\nFlower: Peach blossom\nTree: Red pine\nMunicipalities: Okayama, Kurashiki, Tsuyama, Tamano" > asia/japan/okayama.txt
  echo -e "Major Island: Honshū\nRegion: Chūgoku\nCapital: Hiroshima\nISO: 3166-2:JP-34\nArea code: 082\nBird: Red-throated diver\nFlower: Momiji\nTree: Japanese maple\nMunicipalities: Hiroshima, Fukuyama, Kure, Higashihiroshima, Onomichi" > asia/japan/hiroshima.txt
  echo -e "Major Island: Honshū\nRegion: Chūgoku\nCapital: Yamaguchi\nISO: 3166-2:JP-35\nArea code: 083\nBird: Hooded crane\nFlower: Bitter summer mandarin blossom\nTree: Red pine tree\nMunicipalities: Yamaguchi, Shimonoseki, Ube, Iwakuni" > asia/japan/yamaguchi.txt
  echo -e "Major Island: Shikoku\nRegion: Shikoku\nCapital: Tokushima\nISO: 3166-2:JP-36\nArea code: 088\nBird: White heron\nFlower: Sudachi\nTree: Yamamomo\nMunicipalities: Tokushima, Naruto, Anan, Yoshinogawa, Awa" > asia/japan/tokushima.txt
  echo -e "Major Island: Shikoku\nRegion: Shikoku\nCapital: Takamatsu\nISO: 3166-2:JP-37\nArea code: 087\nBird: Lesser cuckoo\nFlower: Olive\nTree: Olive\nMunicipalities: Takamatsu, Marugame, Kan'onji, Mitoyo, Sakaide" > asia/japan/kagawa.txt
  echo -e "Major Island: Shikoku\nRegion: Shikoku\nCapital: Matsuyama\nISO: 3166-2:JP-38\nArea code: 089\nBird: Japanese robin\nFlower: Satsuma mandarin\nTree: Pine\nMunicipalities: Matsuyama, Imabari, Nīhama, Saijō, Shikokuchūō" > asia/japan/ehime.txt
  echo -e "Major Island: Shikoku\nRegion: Shikoku\nCapital: Kōchi\nISO: 3166-2:JP-39\nArea code: 088\nBird: Fairy pitta\nFlower: Yamamomo\nTree: Yanase Sugi\nMunicipalities: Kōchi, Nankoku, Tosa, Shimanto, Kōnan" > asia/japan/kōchi.txt
  echo -e "Major Island: Kyūshū\nRegion: Kyūshū\nCapital: Fukuoka\nISO: 3166-2:JP-40\nArea code: 092\nBird: Japanese bush warbler\nFlower: Ume blossom\nTree: Azalea\nMunicipalities: Fukuoka, Kitakyūshū, Kurume, Chikuno" > asia/japan/fukuoka.txt
  echo -e "Major Island: Kyūshū\nRegion: Kyūshū\nCapital: Saga\nISO: 3166-2:JP-41\nArea code: 095\nBird: Black-billed magpie\nFlower: Camphor blossom\nTree: Camphor tree\nMunicipalities: Saga, Karatsu, Tosu, Imari" > asia/japan/saga.txt
  echo -e "Major Island: Kyūshū\nRegion: Kyūshū\nCapital: Nagasaki\nISO: 3166-2:JP-42\nArea code: 095\nBird: Mandarin duck\nFlower: Unzentsutsuji\nTree: Sawara\nMunicipalities: Nagasaki, Sasebo, Isahaya, Ōmura" > asia/japan/nagasaki.txt
  echo -e "Major Island: Kyūshū\nRegion: Kyūshū\nCapital: Kumamoto\nISO: 3166-2:JP-43\nArea code: 096\nBird: Eurasian skylark\nFlower: Gentian\nTree: Camphor tree\nMunicipalities: Kumamoto, Yatsushiro, Amakusa, Kōshi" > asia/japan/kumamoto.txt
  echo -e "Major Island: Kyūshū\nRegion: Kyūshū\nCapital: Ōita\nISO: 3166-2:JP-44\nArea code: 097\nBird: Japanese white-eye\nFlower: Bungo-ume blossom\nTree: Bungo-ume tree\nMunicipalities: Ōita, Beppu, Nakatsu, Saiki" > asia/japan/ōita.txt
  echo -e "Major Island: Kyūshū\nRegion: Kyūshū\nCapital: Miyazaki\nISO: 3166-2:JP-45\nArea code: 098\nBird: Ijima copper pheasant\nFlower: Hamayu\nTree: Phoenix palm\nMunicipalities: Miyazaki, Miyakonojō, Nobeoka, Hyūga" > asia/japan/miyazaki.txt
  echo -e "Major Island: Kyūshū\nRegion: Kyūshū\nCapital: Kagoshima\nISO: 3166-2:JP-46\nArea code: 099\nBird: Lidth's jay\nFlower: Miyamakirishima\nTree: Camphor laurel\nMunicipalities: Kagoshima, Kirishima, Kanoya, Satsumasendai" > asia/japan/kagoshima.txt
  echo -e "Major Island: Ryūkyū Islands\nRegion: Kyūshū\nCapital: Naha\nISO: 3166-2:JP-47\nArea code: 098\nBird: Okinawa woodpecker\nFlower: Deego\nTree: Pinus luchuensis\nMunicipalities: Naha, Okinawa, Uruma, Ginowan" > asia/japan/okinawa.txt
}

# Get save point
NEXT_STEP="introduction"
NEED_INITIALIZATION=false
make_sure_tutorial_exists
if [[ ! (-z "$1") ]]; then
  NEXT_STEP=$1
  NEED_INITIALIZATION=true
  echo "$1" > save.txt
else
  if [[ -f "save.txt" ]]; then 
    SAVE=$(cat save.txt)
    if [[ -n "$SAVE" ]]; then
      echo -e "自動保存した地点から再開しますか？ y/n"
      read -r ANSWER
      if [[ "$ANSWER" == "y" ]]; then
        echo -e "途中から始めます\n\n"
        NEXT_STEP=$(cat save.txt)
        NEED_INITIALIZATION=true
      else
        echo -e "最初から始めます\n\n"
      fi
    fi
  fi
fi

# Step controller
while [ -n "$NEXT_STEP" ]; do
  case $NEXT_STEP in
    "introduction")
      introduction
      ;;
    "ls")
      about_ls
      ;;
    "cd")
      about_cd
      ;;
    "pwd")
      if $NEED_INITIALIZATION; then
        cd tutorial || echo "tutorialに移動できませんでした"
        NEED_INITIALIZATION=false
      fi
      about_pwd
      ;;
    "mkdir")
      if $NEED_INITIALIZATION; then
        cd tutorial || echo "tutorialに移動できませんでした"
        NEED_INITIALIZATION=false
      fi
      about_mkdir
      ;;
    "touch")
      if $NEED_INITIALIZATION; then
        cd tutorial || echo "tutorialに移動できませんでした"
        make_sure_any_directory_exists
        NEED_INITIALIZATION=false
      fi
      about_touch
      ;;
    "rmdir")
      if $NEED_INITIALIZATION; then
        cd tutorial || echo "tutorialに移動できませんでした"
        make_sure_any_directory_exists
        make_sure_any_file_exists
        NEED_INITIALIZATION=false
      fi
      about_rmdir
      ;;
    "rm1")
      if $NEED_INITIALIZATION; then
        cd tutorial || echo "tutorialに移動できませんでした"
        make_sure_any_file_exists
        NEED_INITIALIZATION=false
      fi
      about_rm1
      ;;
    "rm2")
      if $NEED_INITIALIZATION; then
        cd tutorial || echo "tutorialに移動できませんでした"
        NEED_INITIALIZATION=false
      fi
      about_rm2
      ;;
    "para1")
      if $NEED_INITIALIZATION; then
        cd tutorial || echo "tutorialに移動できませんでした"
        NEED_INITIALIZATION=false
      fi
      make_sure_yasai_and_kudamon_exist
      about_parameter1
      ;;
    "para2")
      if $NEED_INITIALIZATION; then
        cd tutorial || echo "tutorialに移動できませんでした"
        NEED_INITIALIZATION=false
      fi
      make_sure_yasai_and_kudamon_exist
      about_parameter2
      ;;
    "mv1")
      if $NEED_INITIALIZATION; then
        cd tutorial || echo "tutorialに移動できませんでした"
        NEED_INITIALIZATION=false
      fi
      make_sure_yasai_and_kudamon_exist
      about_mv1
      ;;
    "mv2")
      if $NEED_INITIALIZATION; then
        cd tutorial || echo "tutorialに移動できませんでした"
        NEED_INITIALIZATION=false
      fi
      make_sure_yasai_and_kudamon_exist "ringo in kudamono"
      about_mv2
      ;;
    "mv3")
      if $NEED_INITIALIZATION; then
        cd tutorial || echo "tutorialに移動できませんでした"
        NEED_INITIALIZATION=false
      fi
      about_mv3
      ;;
    "cp")
      if $NEED_INITIALIZATION; then
        cd tutorial || echo "tutorialに移動できませんでした"
        NEED_INITIALIZATION=false
      fi
      about_cp
      ;;
    "tail")
      if $NEED_INITIALIZATION; then
        cd tutorial || echo "tutorialに移動できませんでした"
        NEED_INITIALIZATION=false
      fi
      make_nagai_log_file
      about_tail
      ;;
    "find")
      if $NEED_INITIALIZATION; then
        cd tutorial || echo "tutorialに移動できませんでした"
        NEED_INITIALIZATION=false
      fi
      about_find
      ;;
    "end")
      finalize
      ;;
    "mugen_loop")
      echo "無限ループ"
      read -r
      ;;
    *)
      echo -e"
      $NEXT_STEP　セーブポイントが不正なので最初から始めます
      "
      NEXT_STEP="introduction"
      ;;
  esac
done
