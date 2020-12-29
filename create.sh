#!/bin/bash
# usage ./create.sh [init port] [end port] [tag]

# create 20 containers w/latest tag:
#./create.sh 5050 5079 latest

for i in $(eval echo {$1..$2})
do
          iStr="$(printf '%04d' $i)"
	  MAC="11:22:33:73:${iStr:0:2}:${iStr:2:2}"
	  echo "Creating container cam$i"
          docker run -d -p $i:5051 -e product_id=${MAC} --name cam$i eventcm:$3
done

