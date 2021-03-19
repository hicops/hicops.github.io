#!/bin/bash

#SBATCH --job-name="xpptandem_bjorn"
#SBATCH --output="/home/mhaseeb/parallel_tandem_10_12_01_1/bin/xpptandem_new.%j.%N.out"
#SBATCH --partition=compute
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=24
#SBATCH --export=ALL
#SBATCH -t 8:00:00


ibrun --npernode 2 -v /home/mhaseeb/parallel_tandem_10_12_01_1/bin/tandem.exe /home/mhaseeb/parallel_tandem_10_12_01_1/bin/input2.xml
