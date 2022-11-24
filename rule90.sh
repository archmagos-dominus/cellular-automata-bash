#! /bin/bash

# initialize arrays and counter
cell=(0 0 0 0 1 0 0 0 0 0 1)  # modify this to change the initial state of the automaton
tmp=(0 0 0 0 0 0 0 0 0 0 0)   # output array; make sure it's the same size as your initial state array
i=0
steps=20     # modify this to change the number of steps

# print initial cell array to screen
echo ${cell[@]}

#main loop
until [ $i -eq $steps ]
do
    for (( j=0; j<${#cell[@]}; j++ ))   # read every cell state in the array
    do
        #Define rules:
        #if both neighbouring cells are pupulated, then the current cell dies from overcrowding
        #if either cells on the side are populated, then the cell becomes alive
        #if no cells on the side are populated, then the cell stays dead

        if [ $j -eq 0 ] # special rule for the first cell to make the "play area" loop around
            then
            if [ ${cell[-1]} == 1 ] && [ ${cell[1]} == 1 ]
                then tmp[0]=0
            elif [ ${cell[-1]} == 1 ] && [ ${cell[1]} == 0 ]
                then tmp[0]=1
            elif [ ${cell[-1]} == 0 ] && [ ${cell[1]} == 1 ]
                then tmp[0]=1
            else tmp[0]=0
            fi
        elif [ $j -eq $((${#cell[@]}-1)) ]   # special rule for the last cell to make the "play area" loop around
            then if [ ${cell[-2]} == 1 ] && [ ${cell[0]} == 1 ]
                then tmp[-1]=0
                elif [ ${cell[-2]} == 1 ] && [ ${cell[0]} == 0 ]
                then tmp[-1]=1
                elif [ ${cell[-2]} == 0 ] && [ ${cell[0]} == 1 ]
                then tmp[-1]=1
                else tmp[-1]=0
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
