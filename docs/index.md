---
title: Welcome
toc: true
---

![build](https://github.com/hicops/hicops/workflows/build/badge.svg) [![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/hicops/hicops/blob/develop/README.md#contributing) [![pages yes](https://img.shields.io/badge/pages-yes-blue.svg)](https://hicops.github.io) [![GitHub forks](https://img.shields.io/github/forks/hicops/hicops.svg?style=social&label=Fork&maxAge=2592000)](https://GitHub.com/hicops/hicops/network/) [![GitHub stars](https://img.shields.io/github/stars/hicops/hicops.svg?style=social&label=Star&maxAge=2592000)](https://GitHub.com/hicops/hicops/stargazers/) [![GitHub contributors](https://img.shields.io/github/contributors/hicops/hicops.svg)](https://GitHub.com/hicops/hicops/graphs/contributors/) [![GitHub issues](https://img.shields.io/github/issues/hicops/hicops.svg)](https://GitHub.com/hicops/hicops/issues/) [![Github all releases](https://img.shields.io/github/downloads/hicops/hicops/total.svg)](https://GitHub.com/hicops/hicops/releases/) <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/80x15.png" /></a> [![DOI](https://zenodo.org/badge/301835377.svg)](https://zenodo.org/badge/latestdoi/301835377)

# About

HiCOPS is a software framework for accelerating database peptide search workflows on supercomputers. HiCOPS provided algorithm-independent parallelizations and optimizations can be extended into new HPC database search algorithms or scalably accelerate the existing ones. 

HiCOPS has been implemented using C++17, Python 3.7 and Bash. A high-level graphical abstract of our parallel software framework is shown in the following figure.

![Graphical Abstract]({{ site.baseurl }}/assets/grabs.jpg){: .align-center height="475" }

## Research Work
Please read the following research paper for the introduction to our research, parallel design and other concepts behind HiCOPS. A pre-print of our paper is available [here](). Please cite us if you use our work. Thank you.

## Application
Computational Proteomics researchers and developers can integrate their algorithms within the HiCOPS framework. Integration is as simple as implementing conventional (shared-memory) versions of database indexing, filtering, peptide-to-spectrum scoring, post-processing etc. algorithms within HiCOPS.

## Supported Environments
HiCOPS can seamlessly run on any Linux based workstation, however we recommend running on symmetric multinode (the most common) HPC systems. Sufficient amount of memory resources must be allocated to HiCOPS to handle the database index.

## Credits
HiCOPS is under development at the Parallel Computing and Data Science Laboratory at Florida International University.

| Name                  |                                        Affiliation                                        |                    GitHub                     |
| --------------------- | :---------------------------------------------------------------------------------------: | :-------------------------------------------: |
| Muhammad Haseeb       |       [FIU](https://tinyurl.com/mhaseeb22)                                                | [mhaseeb123](https://github.com/mhaseeb123)   |
| Fahad Saeed           |       [FIU](https://saeedlab.cis.fiu.edu)                                                 | [pcdslab](https://github.com/pcdslab)         |

## Contributions
We welcome contributions via GitHub pull requests. For more information, please refer to [Contributing]({{ site.baseurl }}/contributing) document.

## License
HiCOPS is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>. Both commercial and academic users can collaborate, contribute, and use the software for research or development by acquiring an appropriate license from: fsaeed@fiu.edu.
