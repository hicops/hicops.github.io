#!/bin/bash

#SBATCH --job-name="hicops"
#SBATCH --output="/oasis/scratch/comet/mhaseeb/temp_project/workspaces/set17/workspace1/output/hicops.%j.%N.out"
#SBATCH --partition=compute
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=24
#SBATCH --export=ALL
#SBATCH -t 02:00:00

export OMP_NUM_THREADS      12

ibrun --npernode 2 -bl socket -bp scatter /home/mhaseeb/repos/hicops/install/bin/tools/../hicops /oasis/scratch/comet/mhaseeb/temp_project/workspaces/set17/workspace1/autogen/uparams.txt