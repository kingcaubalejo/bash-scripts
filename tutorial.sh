#!/usr/bin/env bash
echo "TEST"
set -o nounset
set -o errexit

trap ctrl_c INT
 
function ctrl_c() {
  echo "** Trapped CTRL-C"
}
 
for i in `seq 1 5`; do
  sleep 1
  echo -n "."
done