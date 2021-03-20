---
title: Experiment Details
---

# Experimental Details
The details, links and files provided in the following subsections can be used to replicate the experimental findings in the HiCOPS manuscript. 

## Basic Environment
* SMP HPC cluster                
* Linux OS (CentOS, Ubuntu etc)             
* MPI (with threading support)          
* Python 3.7+ and common packages       
* CMake 3.11 or later           
* Docker (for MS/MS data conversion)         

## Datasets Needed
* E<sub>1</sub> = [PXD009072](http://ftp.pride.ebi.ac.uk/pride/data/archive/2019/01/PXD009072/)          
* E<sub>2</sub> = [PXD015890](https://ftp.pride.ebi.ac.uk/pride/data/archive/2019/10/PXD015890)           
* E<sub>3</sub> = [PXD020590](http://ftp.pride.ebi.ac.uk/pride/data/archive/2020/11/PXD020590/)        
* E<sub>4</sub> = Please download the following datasets from the PRIDE Archive and put all files in the same directory. (PXD007871, 009072, 010023, 012463, 013074, 013332, 014802, and 015391). Each dataset can be accessed at: https://www.ebi.ac.uk/pride/archive/projects/PXD0(number)

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

## Comparative analysis reveals orders of magnitude speedups

### Experiment 1
* Database: swiss      
* Dataset: Use the file: 7Sep18\_Olson\_WT24 from the dataset: PXD015890       
* 
#### HiCOPS
* Use this paramters file: [e1.txt]({{ site.baseurl }}/assets/config_hicops/e1.txt)      
* Edit paths to dataset, database, workspace, number of nodes, number of cores etc.      
* Run the [hicops_comet]({{ site.baseurl }}/tools/runtime/hicops_comet) or [hicops_config]({{ site.baseurl }}/tools/runtime/hicops_config) tool depending on your system to generate the uparams.txt file.     
* Use this SLURM script: [hicops.slurm]({{ site.baseurl }}/assets/config_hicops/hicops.slurm) to run HiCOPS.       

**Note:** Make sure to edit the hicops path, output and parameters paths, number of nodes, number of cores per node etc. in the SLURM file. Also make sure that your `LD_LIBRARY_PATH` contains the path: `/path/to/hicops_install/lib`.

#### MSFragger
* Use this paramters file: [e1.params]({{ site.baseurl }}/assets/config_msf/e1.params)      
* Run this python script [mspartition.py]({{ site.baseurl }}/assets/expt_tools/mspartition.py) to create N random partitions of the experimental dataset: `python3.7 mspartition.py -i <path to dataset> -N <partitions>`     
* Use this SLURM script: [msfragger.slurm]({{ site.baseurl }}/assets/config_msf/msfragger.slurm) to run experiment on each partition of the dataset.     

**Note:** Make sure to edit the MSFragger path, output and parameters paths, number of nodes, number of cores per node etc. in the SLURM file.

#### X!Tandem, X!!Tandem, SW-Tandem
* Use this parameter file as the `default_input.xml`: [e1.xml]({{ site.baseurl }}/assets/config_xtandem/e1.xml)             
* Create a FASTA pro file from the SwissProt fasta database using the `tandem/bin/fasta_pro.exe` tool available with X!Tandem.          
* Use this SLURM script: [xtandem.slurm]({{ site.baseurl }}/assets/config_xtandem/xtandem.slurm)        

**Note:** Make sure to edit the X!-, X!!-, SW-(Tandem) paths, output and parameters paths, number of nodes, number of cores per node etc. in the SLURM file.

#### Crux
* Use this parameter file: [e1.params.txt]({{ site.baseurl }}/assets/config_crux/e1.params.txt)
* Run crux using the following command:
  
```bash
crux tide-search --overwrite T --precursor-window 10.0 --precursor-window-type mass --parameter-file /path/to/e1.params.txt /path/to/spectra_file1 /path/to/spectra_file2 ... /path/to/database/or/index
```

**Note:** We recommend running the `tide-index` before running the `tide-search` to once construct the database index and then re-use it. You can run the tide-index using the same paramters file.

```bash
crux tide-index --parameter-file /path/to/params /path/to/protein/db.fasta /path/to/resultant/index
```

### Experiment 2
* Database: swiss      
* Dataset: Use the file: 7Sep18\_Olson\_WT24 from the dataset: PXD015890       

#### HiCOPS
* Use this paramters file: [e2.txt]({{ site.baseurl }}/assets/config_hicops/e2.txt)      
* Edit paths to dataset, database, workspace, number of nodes, number of cores etc.      
* Run the [hicops_comet]({{ site.baseurl }}/tools/runtime/hicops_comet) or [hicops_config]({{ site.baseurl }}/tools/runtime/hicops_config) tool depending on your system to generate the uparams.txt file.      
* Use this SLURM script: [hicops.slurm]({{ site.baseurl }}/assets/config_hicops/hicops.slurm) to run HiCOPS.       

**Note:** Make sure to edit the hicops path, output and parameters paths, number of nodes, number of cores per node etc. in the SLURM file. Also make sure that your `LD_LIBRARY_PATH` contains the path: `/path/to/hicops_install/lib`.

#### MSFragger
* Use this paramters file: [e2.params]({{ site.baseurl }}/assets/config_msf/e2.params)      
* Run this python script [mspartition.py]({{ site.baseurl }}/assets/expt_tools/mspartition.py) to create N random partitions of the experimental dataset: `python3.7 mspartition.py -i <path to dataset> -N <partitions>`     
* Use this SLURM script: [msfragger.slurm]({{ site.baseurl }}/assets/config_msf/msfragger.slurm) to run experiment on each partition of the dataset.     

**Note:** Make sure to edit the MSFragger path, dataset, output and parameters paths, -Xmx(RAM), number of nodes, number of cores per node etc. in the SLURM file.

#### X!Tandem, X!!Tandem, SW-Tandem
* Use this parameter file as the `default_input.xml`: [e2.xml]({{ site.baseurl }}/assets/config_xtandem/e2.xml)            
* Create a FASTA pro file from the SwissProt fasta database using the `tandem/bin/fasta_pro.exe` tool available with X!Tandem.          
* Use this SLURM script: [xtandem.slurm]({{ site.baseurl }}/assets/config_xtandem/xtandem.slurm)        

**Note:** Make sure to edit the X!-, X!!-, SW-(Tandem) paths, output and parameters paths, number of nodes, number of cores per node etc. in the SLURM file.

### Experiment 3
* Database: human      
* Dataset: PXD015890       

#### HiCOPS
* Use this paramters file: [e3.txt]({{ site.baseurl }}/assets/config_hicops/e3.txt)      
* Edit paths to dataset, database, workspace, number of nodes, number of cores etc.      
* Run the [hicops_comet]({{ site.baseurl }}/tools/runtime/hicops_comet) or [hicops_config]({{ site.baseurl }}/tools/runtime/hicops_config) tool depending on your system to generate the uparams.txt file.      
* Use this SLURM script: [hicops.slurm]({{ site.baseurl }}/assets/config_hicops/hicops.slurm) to run HiCOPS.       

**Note:** Make sure to edit the hicops path, output and parameters paths, number of nodes, number of cores per node etc. in the SLURM file. Also make sure that your `LD_LIBRARY_PATH` contains the path: `/path/to/hicops_install/lib`.

#### MSFragger
* Use this paramters file: [e3.params]({{ site.baseurl }}/assets/config_msf/e3.params)        
* Run this python script [mspartition.py]({{ site.baseurl }}/assets/expt_tools/mspartition.py) to create N random partitions of the experimental dataset: `python3.7 mspartition.py -i <path to dataset> -N <partitions>`       
* Use this SLURM script: [msfragger.slurm]({{ site.baseurl }}/assets/config_msf/msfragger.slurm) to run experiment on each partition of the dataset.      

**Note:** Make sure to edit the MSFragger path, dataset, output and parameters paths, -Xmx(RAM), number of nodes, number of cores per node etc. in the SLURM file.

#### X!!Tandem
* Use this parameter file as the `default_input.xml`: [e3.xml]({{ site.baseurl }}/assets/config_xtandem/e3.xml)            
* Create a FASTA pro file from the human fasta database using the `tandem/bin/fasta_pro.exe` tool available with X!Tandem.         
* Use this SLURM script: [xtandem.slurm]({{ site.baseurl }}/assets/config_xtandem/xtandem.slurm)         

#### Comet-MS
* Use this parameter file: [e3.params.txt]({{ site.baseurl }}/assets/config_comet/e3.params)         
* Use this SLURM script: [comet.slurm]({{ site.baseurl }}/assets/config_comet/comet.slurm)          

**Note:** Make sure to edit the Comet path, output and parameters paths, number of nodes, number of cores per node etc. in the SLURM file.

#### MSGF+
* Use this paramter file: [e3.txt]({{ site.baseurl }}/assets/config_msgf/e3.txt)             
* Use this SLURM script: [msgf.slurm]({{ site.baseurl }}/assets/config_msgf/msgf.slurm)           

**Note:** Make sure to edit the Comet path, output and parameters paths, number of nodes, number of cores per node etc. in the SLURM file.

### Experiment 4
* Database: swiss      
* Dataset: PXD015890       

#### HiCOPS, MSFragger, X!Tandem, X!!Tandem, SW-Tandem, Crux
Follow the same steps and configuration files as for [Experiment 1](#experiment-1). Just replace the dataset path to point to the complete dataset: PXD015890 instead of only one file.

### Experiment 5
* Database: swiss      
* Dataset: PXD015890       

#### HiCOPS, MSFragger
Follow the same steps and configuration files as for [Experiment 2](#experiment-2). Just replace the dataset path to point to the complete dataset: PXD015890 instead of only one file.

### Experiment 6
* Database: human      
* Dataset: Use the dataset: E<sub>4</sub>       

#### HiCOPS
* Use this paramters file: [e6.txt]({{ site.baseurl }}/assets/config_hicops/e6.txt)      
* Edit paths to dataset, database, workspace, number of nodes, number of cores etc.      
* Run the [hicops_comet]({{ site.baseurl }}/tools/runtime/hicops_comet) or [hicops_config]({{ site.baseurl }}/tools/runtime/hicops_config) tool depending on your system to generate the uparams.txt file.      
* Use this SLURM script: [hicops.slurm]({{ site.baseurl }}/assets/config_hicops/hicops.slurm) to run HiCOPS.       

**Note:** Make sure to edit the hicops path, output and parameters paths, number of nodes, number of cores per node etc. in the SLURM file. Also make sure that your `LD_LIBRARY_PATH` contains the path: `/path/to/hicops_install/lib`.

#### MSFragger
* Use this paramters file: [e6.params]({{ site.baseurl }}/assets/config_msf/e6.params)        
* Run this python script [mspartition.py]({{ site.baseurl }}/assets/expt_tools/mspartition.py) to create N random partitions of the experimental dataset: `python3.7 mspartition.py -i <path to dataset> -N <partitions>`       
* Use this SLURM script: [msfragger.slurm]({{ site.baseurl }}/assets/config_msf/msfragger.slurm) to run experiment on each partition of the dataset.      

**Note:** Make sure to edit the MSFragger path, dataset, output and parameters paths, -Xmx(RAM), number of nodes, number of cores per node etc. in the SLURM file.

#### Comet-MS
* Use this parameter file: [e6.params.txt]({{ site.baseurl }}/assets/config_comet/e6.params)       
* Use this SLURM script: [comet.slurm]({{ site.baseurl }}/assets/config_comet/comet.slurm)             

**Note:** Make sure to edit the Comet path, output and parameters paths, number of nodes, number of cores per node etc. in the SLURM file.