#!/bin/bash

for i in sam awen jerry axiao pangzi ;
do 
useradd $i && rm -rf $i 
done 




