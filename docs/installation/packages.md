---
title: Required Packages
---

# Required Packages

Install and load the latest versions of the following packages, preferably through [Spack](https://spack.readthedocs.io). Read more about how to install Spack, and how to install and load packages using Spack [here](https://spack.readthedocs.io/en/latest/getting_started.html).

| Required Packages  |                   |               |
|--------------------|-------------------|---------------|
| boost              | cmake             | py-pytz       |
| py-numpy           | py-setuptools-scm | py-kiwisolver |
| py-python-dateutil | pkgconf           | py-numexpr    |
| py-setuptools      | py-et-xmlfile     | py-matplotlib |
| py-bottleneck      | papi              | py-jdcal      |
| py-pyparsing       | py-cython         | py-pandas     |
| py-subprocess32    | py-cycler         | py-openpyxl   |
| py-six             | py-argparse       | ***mpich***   |
| ***python***       |                   |               |

**Note:** You may skip MPI installation if you are running on an HPC cluster system with built-in MPI distribution (e.g. CrayPE, ibrun, Intel MPI etc.) and simply load that into your environment. Similarly, you can use internal Python distribution and packages if already available and skip installation.
