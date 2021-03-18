---
title: Welcome
toc: true
---

![build](https://github.com/hicops/hicops/workflows/build/badge.svg) [![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)]({{ site.baseurl }}/contributing#Contribute) [![pages yes](https://img.shields.io/badge/pages-yes-blue.svg)](https://hicops.github.io) [![GitHub forks](https://img.shields.io/github/forks/hicops/hicops.svg?style=social&label=Fork&maxAge=2592000)](https://GitHub.com/hicops/hicops/network/) [![GitHub stars](https://img.shields.io/github/stars/hicops/hicops.svg?style=social&label=Star&maxAge=2592000)](https://GitHub.com/hicops/hicops/stargazers/) [![GitHub contributors](https://img.shields.io/github/contributors/hicops/hicops.svg)](https://GitHub.com/hicops/hicops/graphs/contributors/) [![GitHub issues](https://img.shields.io/github/issues/hicops/hicops.svg)](https://GitHub.com/hicops/hicops/issues/) [![Github all releases](https://img.shields.io/github/downloads/hicops/hicops/total.svg)](https://GitHub.com/hicops/hicops/releases/)

# About

HiCOPS is a software framework designed to accelerate database peptide search workflows on HPC environments for large-scale peptide identification from the mass spectrometry (MS/MS) data. HiCOPS provides many data analysis, curve fitting, and optimization algorithms that can be used to develop new database search pipelines or accelerate the existing ones. 

HiCOPS has been implemented using C++14, Python 3.7 and Bash. A high-level graphical abstract of our parallel software framework is shown in the following figure.

![Graphical Abstract]({{ site.baseurl }}/assets/grabs.jpg){: .align-center height="475" }

## Research Work
Please read the following research paper for the introduction to our research, parallel design and other concepts behind HiCOPS. A pre-print of our paper is available [here](). Please cite us if you use our work. Thank you.

*[TODO] Placeholder for the paper*

## Application
Computational Proteomics researchers and developers can utilize HiCOPS framework to accelerate their worklflows. Integration is as simple as implementing/integrating shared-memory versions of database indexing, filtering, peptide-to-spectrum scoring, post-processing etc. algorithms within HiCOPS.

## Supported Environments
HiCOPS can seamlessly run on any Linux based personal laptops, desktops, workstations and symmetric multicore multinode (the most common) HPC systems. Sufficient amount of memory resources must be allocated to HiCOPS to handle the database index.

## Credits
HiCOPS is under development at the Parallel Computing and Data Science Laboratory at Florida International University.

| Name                  |                                        Affiliation                                        |                    GitHub                     |
| --------------------- | :---------------------------------------------------------------------------------------: | :-------------------------------------------: |
| Muhammad Haseeb       |       [FIU](https://tinyurl.com/mhaseeb22)                                                | [mhaseeb123](https://github.com/mhaseeb123)   |
| Fahad Saeed           |       [FIU](https://saeedlab.cis.fiu.edu)                                                 | [pcdslab](https://github.com/pcdslab)         |

## Contributions
We welcome contributions via GitHub pull requests. For more information, please refer to [Contributing]({{ site.baseurl }}/contributing) document.

## License
GPL v3.0 for all academic users. Commercial users may acquire a license from the [FIU Technology Transfer Office](http://research.fiu.edu/ored/)
