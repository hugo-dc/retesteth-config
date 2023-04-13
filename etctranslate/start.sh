#!/bin/sh

wevm=$(which evmetc)
if [ -z $wevm ]; then
   >&2 echo "Can't find Core Geths's evm 'evmetc' executable alias in the system path!"
   exit 1
fi

if [ $1 = "t8n" ] || [ $1 = "b11r" ]; then
    evmetc $1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14 $15 $16 $17 $18 $19 $20 $21 $22 $23 $24 $25 $26
elif [ $1 = "-v" ]; then
    evmetc -v
else
    stateProvided=0
    for index in ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17} ${18} ${19} ${20} ; do
        if [ $index = "--input.alloc" ]; then
            stateProvided=1
            break
        fi
    done
    if [ $stateProvided -eq 1 ]; then
        evmetc t8n ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17} ${18} ${19} ${20} --verbosity 2
    else
        evmetc t9n ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17} ${18} ${19} ${20}
    fi
fi
