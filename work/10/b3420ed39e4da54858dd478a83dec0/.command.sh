#!/bin/bash -ue
samtools sort -T deleteme -m 966367642 -@ 2 \
-no sample4.bam clustering.bam || exit $?
samtools fastq sample4.bam | gzip -c > sample4.fastq.gz && rm sample4.bam
