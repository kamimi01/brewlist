#!/bin/bash

# README.mdのディレクトリまで移動
READMEDIR="/Users/mikaurakawa/Desktop/Shell_Projects/brewlist"
cd $READMEDIR

# README.mdファイルの行数を取得
READMEFILENAME="/Users/mikaurakawa/Desktop/Shell_Projects/brewlist/README.md"
declare -i NUMBEROFALLLINES
NUMBEROFALLLINES=`cat ${READMEFILENAME} | wc -l`

# 9行目以降を削除して、ファイルを上書き
sed -i -e "9,${NUMBEROFALLLINES}d" ${READMEFILENAME}

# homebrewにインストールしているソフトウェアの情報を出力するコマンドの実行
# 一行ずつ取り出してマークダウンの表形式に出力し、README.mdに追記
brew list --versions | while read -r line
do
  set ${line}
  SOFTWARENAME=${1}
  VERSION1=${2}
  VERAION2=${3}
  echo "| ${SOFTWARENAME} | ${VERSION1} |" >> README.md
done

# よくわからんファイルを削除
rm README.md-e

# Githubにコミット&プッシュ
git add .
git commit -m "update brew info"
git push origin main