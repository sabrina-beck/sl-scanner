#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NO_COLOR='\033[0m'

buildDir="build/"
testResultDir="${buildDir}tests/"

mkdir -p $testResultDir

for testFile in tests/input/*; do

  testNumber=$(echo $testFile | cut -c 15-16)
  echo -n "Running test $testNumber"

  testResultFile="tokens$testNumber.res"
  testResultPath="${testResultDir}${testResultFile}"

  ./build/test_scanner < $testFile > $testResultPath

  DIFF=$(diff $testResultPath tests/output/${testResultFile})
  if [ "$DIFF" != "" ]
  then
    echo -e " | ${RED}FAILED${NO_COLOR}"
  else
    echo -e " | ${GREEN}SUCCESS${NO_COLOR}"
  fi
done