#!/bin/bash -ue
samtools sort -T deleteme -m 966367642 -@ 2 \
-no sample6.bam clustering.bam || exit $?
samtools fastq sample6.bam | gzip -c > sample6.fastq.gz && rm sample6.bam
