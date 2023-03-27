#!/bin/bash

#SBATCH --job-name="comet"
#SBATCH --output="/home/mhaseeb/comet/cmt.%j.out"
#SBATCH --partition=compute
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=24
#SBATCH --export=ALL
#SBATCH -t 6:00:00

#Set the number of openmp threads
export OMP_NUM_THREADS=24

#Run the job using
/home/mhaseeb/comet/comet.2020012.linux.exe -P<path to .params file> <path to the dataset *.mzML>
