#!/bin/bash -ue
samtools sort -T deleteme -m 966367642 -@ 2 \
-no sample3.bam clustering.bam || exit $?
samtools fastq sample3.bam | gzip -c > sample3.fastq.gz && rm sample3.bam
