#!/bin/bash -ue
samtools sort -T deleteme -m 966367642 -@ 2 \
-no sample1.bam clustering.bam || exit $?
samtools fastq sample1.bam | gzip -c > sample1.fastq.gz && rm sample1.bam
