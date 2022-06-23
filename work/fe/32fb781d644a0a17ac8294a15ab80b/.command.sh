#!/bin/bash -ue
load-into-counting.py -T 8 -N 1 -x 1e9 -k 20 -b -f -s tsv sample5.ct.gz sample5.fastq.gz
