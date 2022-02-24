#!/usr/bin/env bash

if [ ! -d "../data" ]; then
  mkdir ../data
fi
if [ ! -d "../data/raw" ]; then
  mkdir ../data/raw
fi
cd ../data/raw
wget 'https://drive.google.com/uc?id=1_ee_0u7vcNLOfNLegJRHmolfH5ICW-XS&export=download' -O 'identity_CelebA.txt'
wget 'https://drive.google.com/uc?id=0B7EVK8r0v71pblRyaVFSWGxPY0U&export=download&resourcekey=0-YW2qIuRcWHy_1C2VaRGL3Q' -O 'list_attr_celeba.txt'
wget 'https://drive.google.com/uc?id=0B7EVK8r0v71pZjFTYXZWM3FlRnM&export=download&resourcekey=0-dYn9z10tMJOBAkviAcfdyQ' --save-cookies cookies.txt --keep-session-cookies -O 'img_align_celeba.zip.token'
token=`cat img_align_celeba.zip.token | grep -Eo "confirm=\w+"`
wget 'https://drive.google.com/uc?id=0B7EVK8r0v71pZjFTYXZWM3FlRnM&export=download&'$token'&resourcekey=0-dYn9z10tMJOBAkviAcfdyQ' --load-cookies cookies.txt -O 'img_align_celeba.zip'
rm cookies.txt img_align_celeba.zip.token
unzip img_align_celeba.zip
rm img_align_celeba.zip
cd ../../preprocess
