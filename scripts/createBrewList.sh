#!/bin/bash

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

BREWLISTDIR="/Users/mikaurakawa/Desktop/Shell_Projects/brewlist"
COMMITMESSAGE="update brew info"

# Githubにコミット&プッシュ
cd $BREWLISTDIR
git add .
git commit -m $COMMITMESSAGE
git push origin main