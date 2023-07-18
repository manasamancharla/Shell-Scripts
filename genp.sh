#!/bin/bash

# This script generates a random password


# Function to display the usage of the script
usage() {
  echo "Usage: ${0} [-vh] [-l LENGTH]" >&2
  echo 'Generate a random password.'
  echo ' -l LENGTH Specify the password length.'
  echo ' -h help.'
  echo ' -v Increase verbosity.'
  exit 1
}

# Function to display messages if verbosity mode is enabled 
display() {
 local MESSAGE="${@}"
 if [[ "${VERBOSE}" = 'true' ]]
 then 
   echo "${MESSAGE}"
 fi
}
 

# Set a default password length
LENGTH=48

# Code to process the command-line options passed to the script
while getopts vhl: OPTION
do
  case ${OPTION} in
    v)
      VERBOSE='true'
      display 'Verbose mode on.'
      ;;
    l)
      LENGTH="${OPTARG}"
      ;;
    h)
      usage
      ;;
    ?)
      echo 'Invalid option.' >&2
      echo 'use -h flag to get more info'
      exit 1
      ;;
  esac
done

display 'Generating Password'

# Password Generation
PASSWORD=$(date +%s%N${RANDOM}${RANDOM}${RANDOM} | head -c${LENGTH})

display 'Done'
display 'Here is the password '

echo "${PASSWORD}"

exit 0
