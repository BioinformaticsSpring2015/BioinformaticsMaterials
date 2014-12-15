#!/bin/bash

##Make syllabus out of modules
##dependencies: pandoc (http://johnmacfarlane.net/pandoc/)
##syntax: syllabus.sh syllabus
##output: syllabus.md

#Concatenate syllabus using order of modules in syllabus.lst
cat $(grep -v '^#' $1.lst) > $1.md

#Convert from .md to .docx using pandoc
pandoc $1.md -o $1.odt