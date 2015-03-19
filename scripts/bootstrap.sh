#!/bin/bash	 
#$ -V	#Inherit the submission environment
#$ -cwd	# Start job in submission directory
#$ -N bootstrap	# Job Name
#$ -j y	# Combine stderr and stdout
#$ -o $JOB_NAME.o$JOB_ID	# Name of the output file (eg. myMPI.oJobID)
#$ -pe 1way 12	# Requests 12 tasks/node, 12 cores total
#$ -q normal	# Queue name normal
#$ -l h_rt=01:30:00	# Run time (hh:mm:ss) - 1.5 hours
#$ -M username@patriots.uttyler.com	# Address for email notification
#$ -m be	# Email at Begin and End of job

set -x	# Echo commands

ibrun phyml -i dna.phy.dat -d nt -n 1 -b 100 --run_id bootstrap -m GTR -f m -c 4 -a e -o tlr -s NNI
