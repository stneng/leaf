#!/usr/bin/env bash

if [ -d "./data/train" ] && [ -d "./data/test" ] && [ -d "./data/val" ]; then
  exit 0
fi
if [ ! -d "./data" ]; then
  mkdir ./data
fi
if [ ! -d "./data/train" ]; then
  mkdir ./data/train
fi
if [ ! -d "./data/test" ]; then
  mkdir ./data/test
fi
if [ ! -d "./data/val" ]; then
  mkdir ./data/val
fi
cd ./data
wget 'https://drive.google.com/uc?id=1ISzp69JmaIJqBpQCX-JJ8-kVyUns8M7o&export=download' -O reddit_subsampled.zip
unzip reddit_subsampled.zip
rm reddit_subsampled.zip
mv ./new_small_data/train_data.json ./train/
mv ./new_small_data/test_data.json ./test/
mv ./new_small_data/val_data.json ./val/
rm -r ./new_small_data
cd ..
