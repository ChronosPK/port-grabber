#/usr/bin/bash

OPTIONS=$(getopt -o hf:gb -l help,file: -- "$@")

if [ $? -ne 0 ]; then
  echo "getopt error"
  exit 1
fi

eval set -- $OPTIONS

while true; do
  case "$1" in
    -h|--help) HELP=1 ;;
    -f|--file) FILE="$2" ; shift ;;
    --)        shift ; break ;;
    *)         echo "unknown option: $1" ; exit 1 ;;
  esac
  shift
done

if [ $# -ne 0 ]; then
  echo "unknown option(s): $@"
  exit 1
fi

#echo "Getting the output from the nmap scan"

cat $FILE| grep '/.*open'| cut -d '/' -f 1| tr '\n' ', '| sed 's/.$//g'
