#!/bin/bash

#SBATCH --job-name="frag"
#SBATCH --output="/home/mhaseeb/MSFragger-3.0/fragger.%j.%N.out"
#SBATCH --partition=compute
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=24
#SBATCH --export=ALL
#SBATCH -t 21:00:00

#Set the number of openmp threads
export OMP_NUM_THREADS=24

#Run the job using
timem java -Xmx90G -jar /home/mhaseeb/MSFragger-3.0/MSFragger-3.0.jar /home/mhaseeb/MSFragger-3.0/large_scale.params $OASIS/mzML15G/*.mzML
