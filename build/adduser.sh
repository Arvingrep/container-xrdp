#!/bin/bash

for i in sam awen jerry axiao pangzi ;
do 
useradd $i && echo $i:$i | chpasswd  && usermod -aG wheel $i
done 




