#!/bin/bash

db_host=$1
db_user=$2
db_name=$3
path_to_source=$4

mysql -u"$2" -h"$1" -p -e "create database "$3";use "$3";source "$4";"