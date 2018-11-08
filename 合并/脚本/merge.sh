#!/bin/bash

for file in *
do
  if test -f $file
  then
      find $1  -name $file -exec cp -rf $file {} \;
  fi
done




