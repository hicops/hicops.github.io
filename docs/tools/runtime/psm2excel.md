---
title: psm2excel
---

# psm2excel

Command line tool that concatenates the peptide identification results written by HiCOPS as `TSV` files in the specified output directory, into a complete `Excel` file. The tool removes the partial TSV files as it processes them to clean the clutter.

Please make sure that the specified directory only contains the `TSV` files generated by ***ONLY*** one HiCOPS run. To make sure of that, please use a unique output directory for each HiCOPS run or first convert the `TSV` files into Excel before running another experiment with the same output directory.

## General Syntax

```bash
$ $HICOPS_INSTALL/bin/tools/psm2excel -h
usage: psm2excel [-h] -i DATA_DIR [-o OFILE]

Merge partial TSV files into XLSX

optional arguments:
  -h, --help            show this help message and exit
  -i DATA_DIR, --idir DATA_DIR
                        Path to partial TSV files
  -o OFILE, --ofile OFILE
                        Path to Output file (default: idir/Results.xlsx)
```

## Example Usage

```bash
$ $HICOPS_INSTALL/bin/tools/psm2excel -i ~/workspace/output
Loading File: 10.05.2020.17.43.20_0_0.tsv
Loading File: 10.05.2020.17.43.20_0_1.tsv
Loading File: 10.05.2020.17.43.20_0_2.tsv
Loading File: 10.05.2020.17.43.20_0_3.tsv

Constructing DataFrame...

Writing to Excel...

DONE:  /lclhome/mhase003/workspace/output/Results.xlsx
```