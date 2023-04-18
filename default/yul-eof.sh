#!/bin/sh
solc=$(which solc)
if [ -z $solc ]; then
  >&2 echo "yul.sh \"Yul compilation error: 'solc' not found!\""
  echo "0x"
else
  echo 0x`/home/hugo/workspace/solidity/build/solc/solc --strict-assembly --evm-version shanghai --experimental-eof-version 1 --optimize --yul-optimizations ":" --bin $1 2>/dev/null | grep "Binary representation:" -A 1 | tail -n1`
fi
