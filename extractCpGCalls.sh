
#!/bin/bash

if [ "$1" == "-h" ] ; then
  echo -e "Extract CpG calls based on RegEx for all files in directory
  Usage: `basename $0` -i <dirIn> -o <dirOut> -f <files> -t <target> -r <regex>
  <dirIn>: input directory
  <dirOut>: output directory
  <files>: files to be grepped
  <target>: name of target gene (for label)
  <regex>: regular expression defining range to yank, in format '(^chr# \t range)' "
  exit 0
fi

## store input
while [ $# -gt 0 ]
do
  case "$1" in
    -i) dirIn="$2"; shift;;
    -o) dirOut="$2"; shift;;
    -f) file="$2"; shift;;
    -t) target="$2"; shift;;
    -r) regex="$2"; shift;;
  esac
  shift
done

## grep files one by one, send to "ex_target_filename"
cd $dirIn

for f in $file
do
  echo "Grepping $f..."
  grep -E "$regex" $f > $dirOut/${f##*/}.ex_$target
done
