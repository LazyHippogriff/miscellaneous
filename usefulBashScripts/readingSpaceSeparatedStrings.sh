#This script will read a file(named example) containing 2 space separated strings on each line.

#!/bin/bash
cat example | while read n
        do
                first=$(echo $n | cut -d " " -f 1)
                second=$(echo $n | cut -d " " -f 2)
                echo "first--> $first, second-->$second"
        done
