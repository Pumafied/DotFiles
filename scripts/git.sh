#!/bin/bash
a=""
b=""
for i in $(seq 1 10)
do
	    b=$(git diff --shortstat "@{ $i day ago }")
			    if [[ "$b" != "$a" ]]; then
						        echo $i "day ago" $b
										    fi
												    a=$b
													done
					fi
done
