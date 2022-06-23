#!/bin/bash -ue
samtools sort -T deleteme -m 966367642 -@ 2 \
-o sample2.bam variants.bam
samtools index sample2.bam
