#!/bin/bash -ue
samtools sort -T deleteme -m 966367642 -@ 2 \
-no sample2.bam clustering.bam || exit $?
samtools fastq sample2.bam | gzip -c > sample2.fastq.gz && rm sample2.bam
