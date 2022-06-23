#!/bin/bash -ue
fasta_generate_regions.py genome.fa.fai 100000 > regions.txt
freebayes-parallel regions.txt 8 -f genome.fa sample5.bam \
--no-partial-observations --report-genotype-likelihood-max --genotype-qualities --min-repeat-entropy 1 --min-coverage 10 > sample5.vcf
