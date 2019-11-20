#!/bin/sh
echo "What is your name?"
read name
echo "Good then $name"
echo "I will create a file called ${name}_file"
touch "${name}_file"