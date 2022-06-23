#!/bin/bash -ue
samtools sort -T deleteme -m 966367642 -@ 2 \
-no sample5.bam clustering.bam || exit $?
samtools fastq sample5.bam | gzip -c > sample5.fastq.gz && rm sample5.bam
