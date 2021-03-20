#!/bin/bash

#SBATCH --job-name="msgf"
#SBATCH --output="/home/mhaseeb/msgf+/msgf.%j.%N.out"
#SBATCH --partition=compute
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=24
#SBATCH --export=ALL
#SBATCH -t 10:00:00

#Set the number of openmp threads
export OMP_NUM_THREADS=24

#Run the job using
java -Xmx110G -jar /home/mhaseeb/msgf+/MSGFPlus.jar -conf <path to params.txt>
