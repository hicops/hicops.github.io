---
title: Required Packages
---

# Required Packages

Install and load the latest versions of the following packages, preferably through [Spack](https://spack.readthedocs.io). Read more about how to install Spack, and how to install and load packages using Spack [here](https://spack.readthedocs.io/en/latest/getting_started.html).

|  Packages          |                   |               |
|--------------------|-------------------|---------------|
| boost              | cmake             | py-pytz       |
| py-numpy           | py-setuptools-scm | py-kiwisolver |
| py-python-dateutil | pkgconf           | py-numexpr    |
| py-setuptools      | py-et-xmlfile     | py-matplotlib |
| py-bottleneck      | py-argparse       | py-jdcal      |
| py-pyparsing       | py-cython         | py-pandas     |
| py-subprocess32    | py-cycler         | py-openpyxl   |
| py-six             | ***mpich***       | ***python***  |

**Note:** You may skip MPI installation if you are running on an HPC cluster system with built-in MPI distribution (e.g. CrayPE, ibrun, Intel MPI etc.) and simply load that into your environment. Similarly, you can use internal Python distribution and packages if already available and skip installation.

## Example Package Install
Install the `py-numpy` and `py-pandas` packages  dependencies using Spack like this:

```bash
# Spack automatically installs the dependecies

# install py-numpy with gcc@<version> compiler
$ spack install py-numpy%gcc@<version>
# load the package along with all its dependencies
$ spack load -r py-numpy

# install py-pandas with gcc@<version> compiler
$ spack install py-pandas%gcc@<version>
# load the package along with all its dependencies
$ spack load -r py-pandas

# install cmake with gcc@<version> compiler
$ spack install cmake%gcc@<version>
# load the package along with all its dependencies
$ spack load -r cmake
```
