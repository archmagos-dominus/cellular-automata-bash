#! /bin/bash

# initialize arrays and counter
cell=(0 0 0 0 1 0 0 0 0 0)
tmp=(0 0 0 0 0 0 0 0 0 0)
i=0

# print initial cell array to screen
echo ${cell[@]}

#main loop
until [ $i -eq 15 ]     # modify this to change the number of steps
do
    for (( j=0; j<${#cell[@]}; j++ ))   # read every cell state in the array
    do
        if [ $j -eq 0 ] # special rule for the first cell to make the "play area" loop around
            then
            if [ ${cell[9]} == 1 ] && [ ${cell[1]} == 1 ]
                then tmp[0]=0
            elif [ ${cell[9]} == 1 ] && [ ${cell[1]} == 0 ]
                then tmp[0]=1
            elif [ ${cell[9]} == 0 ] && [ ${cell[1]} == 1 ]
                then tmp[0]=1
            else tmp[0]=0
            fi
        elif [ $j -eq 9 ]   # special rule for the last cell to make the "play area" loop around
            then if [ ${cell[8]} == 1 ] && [ ${cell[0]} == 1 ]
                then tmp[9]=0
                elif [ ${cell[8]} == 1 ] && [ ${cell[0]} == 0 ]
                then tmp[9]=1
                elif [ ${cell[8]} == 0 ] && [ ${cell[0]} == 1 ]
                then tmp[9]=1
                else tmp[9]=0
            fi
        else    # main rules for the cell states (XOR)
            if [ ${cell[$j-1]} == 1 ] && [ ${cell[$j+1]} == 1 ]
                then tmp[$j]=0
                elif [ ${cell[$j-1]} == 1 ] && [ ${cell[$j+1]} == 0 ]
                then tmp[$j]=1
                elif [ ${cell[$j-1]} == 0 ] && [ ${cell[$j+1]} == 1 ]
                then tmp[$j]=1
                else tmp[$j]=0
            fi
        fi
    done
    i=$(( i+1 ))    # increment counter
    cell=(${tmp[*]})    # temporary array becomes the main array once the operations have been finished
    echo 'Step' ${i}    # show the current step of the process
    echo ${cell[@]}     # print cell array to the screen
done
