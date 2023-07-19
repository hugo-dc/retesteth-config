#!/bin/sh

wevm=$(which evmone-t8n)

if [ -z $wevm ]; then
   >&2 echo "Can't find EvmOne's 'evmone' executable alias in the system path!"
   exit 1
fi

if [ $1 = "t8n" ] || [ $1 = "b11r" ]; then
    evmone-t8n $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14 $15 $16 $17 $18 $19 $20 $21 $22 $23 $24 $25 $26
elif [ $1 = "-v" ]; then
    evmone-t8n -v
elif [ $1 = "eof" ]; then
  #echo "2: $2 3: $3 4: $4 5: $5"
  echo $5 | evmone-eofparse --fork $3 
else
    stateProvided=0
    readErrorLog=0
    errorLogFile=""
    cmdArgs=""
    for index in ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17} ${18} ${19} ${20} ${21} ${22} ${23} ${24} ${25} ${26}; do
        if [ $index = "--input.alloc" ]; then
            stateProvided=1
        fi
        if [ $readErrorLog -eq 1 ]; then
            errorLogFile=$index
            readErrorLog=0
            continue
        fi
        if [ $index = "--output.errorlog" ]; then
            readErrorLog=1
            continue
        fi
        cmdArgs=$cmdArgs" "$index
    done
    if [ ! -z "$errorLogFile" ]; then
      if [ $stateProvided -eq 1 ]; then
          echo $1
          evmone-t8n $cmdArgs --verbosity 2 2> $errorLogFile
      else
          evmone-t9n $cmdArgs 2> $errorLogFile
      fi
    fi
fi
