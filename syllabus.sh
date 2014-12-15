#!/bin/bash

##Concatenate syllabus using order of modules in syllabus.lst
##syntax: syllabus.sh syllabus
##output: syllabus.md

cat $(grep -v '^#' $1.lst) > $1.md