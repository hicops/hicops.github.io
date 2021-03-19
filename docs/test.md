---
title: Experiment Details
---

# Experimental Details
The details, links and files provided in the following subsections can be used to replicate the experimental findings in the HiCOPS manuscript. 

## Basic Environment
* SMP HPC cluster                
* Linux OS (CentOS, Ubuntu etc)             
* MPI          
* Python 3.7+ and common packages      
* CMake 3.11 or later        

## Datasets Needed
* E<sub>1</sub> = [PXD009072](http://ftp.pride.ebi.ac.uk/pride/data/archive/2019/01/PXD009072/)
* E<sub>2</sub> = [PXD015890](https://ftp.pride.ebi.ac.uk/pride/data/archive/2019/10/PXD015890)           
* E<sub>3</sub> = [PXD020590](http://ftp.pride.ebi.ac.uk/pride/data/archive/2020/11/PXD020590/)        
* E<sub>3</sub> = Please download the following datasets from the PRIDE Archive and put all files in the same directory. (PXD007871, 009072, 010023, 012463, 013074, 013332, 014802, and 015391). Each dataset can be accessed at: https://www.ebi.ac.uk/pride/archive/projects/PXD0(number)

### Processing Instructions
Please download the RAW files from the following links and then convert them to MS2, mzML and/or MGF as per requirements. Use the provided [raw2ms2]({{ site.baseurl }}/tools/ms2prep/raw2ms2) too for conversion from any format to MS2. See more [here]({{ site.baseurl }}/tools/ms2prep/raw2ms2). The same tool can be used to convert to other formats. Just change the conversion output file format (currently set to ms2) in *line#62* of the tool as follows:

```bash

line 61 # run msconvert
line 62 docker run -it --rm -v $WDIR:$WDIR chambm/pwiz-skyline-i-agree-to-the-vendor-licenses wine msconvert -f $WDIR/list --<your_output_format> -o $WDIR/converted
```

Due to the massive sizes of these datasets, we cannot provide them pre-converted.

## Databases Needed
The following two databases are needed:
* [Homo sapiens](https://www.uniprot.org/proteomes/UP000005640)        
* [SwissProt](https://www.uniprot.org/uniprot/?query=proteome:UP000005640%20reviewed:yes)      

### Processing Instructions
Please download all proteins in the FASTA format. The pre-processed human database for HiCOPS are provided here.
* [human.tar]({{ site.baseurl }}/assets/dbparts/human.tar)        
* ***swiss.tar*** Please use the workflow mentioned [here]({{ site.baseurl }}/../getting_started#setup-database) to generate the database parts for HiCOPS. We could not attach it here due to its large size.

## Replicate: Comparative analysis reveals orders of magnitude speedups

### Experiment 1
* Database: swiss      
* Dataset: Use the file: 7Sep18\_Olson\_WT24 from the dataset: PXD015890       

#### HiCOPS
* Use this paramters file: [e1.txt]({{ site.baseurl }}/assets/config_hicops/e1.txt)      
* Edit paths to dataset, database, workspace, number of nodes, number of cores etc.      
* Run the [hicops_comet]({{ site.baseurl }}/tools/runtime/hicops_comet) or [hicops_config]({{ site.baseurl }}/tools/runtime/hicops_config) tool depending on your system to generate the uparams.txt file.     
* Use this SLURM script: [e1.slurm]({{ site.baseurl }}/assets/config_hicops/e1.slurm) to run HiCOPS as follows:

```bash
# schedule the slurm script
sbatch e1.slurm
```

**Note:** Make sure to edit the hicops, output and parameters paths, number of nodes, number of cores per node etc. in the SLURM file. Also make sure that your `LD_LIBRARY_PATH` contains the path: `/path/to/hicops_install/lib`.

#### MSFragger
* Use this paramters file: [e1.params]({{ site.baseurl }}/assets/config_msf/e1.params)
* Run this python script [mspartition.py]({{ site.baseurl }}/assets/expt_tools/mspartition.py) to create N random partitions of the experimental dataset: `python3.7 mspartition.py -i <path to dataset> -N <partitions>`
* Use this SLURM script: [e1.slurm]({{ site.baseurl }}/assets/config_msf/e1.slurm) to run experiment on each partition of the dataset.

```bash
# schedule the slurm script
sbatch e1.slurm
```

#### X!Tandem, X!!Tandem, SW-Tandem
* Use this parameter file as the `default_input.xml`: [e1.xml]({{ site.baseurl }}/assets/config_xtandem/e1.xml)
* Create a FASTA pro file from the SwissProt fasta database using the `tandem/bin/fasta_pro.exe` tool available with X!Tandem.
* Use this SLURM script: [e1.slurm]({{ site.baseurl }}/assets/config_xtandem/e1.slurm)

```bash
# schedule the slurm script
sbatch e1.slurm
```

