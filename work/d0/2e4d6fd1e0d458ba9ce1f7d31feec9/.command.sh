#!/bin/bash -ue
load-into-counting.py -T 8 -N 1 -x 1e9 -k 20 -b -f -s tsv sample2.ct.gz sample2.fastq.gz
