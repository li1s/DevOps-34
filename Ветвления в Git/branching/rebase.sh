#!/bin/bash
# display command line options

count=1
for param in "$@"; do
    echo "\$@ Parameter #$count = $param"
    count=$(( $count + 1 ))
done
<<<<<<< HEAD

echo "====="
=======
>>>>>>> a2ed35f (git-rebase1)
