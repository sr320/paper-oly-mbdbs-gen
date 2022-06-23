#!/bin/bash -ue
samtools sort -T deleteme -m 966367642 -@ 2 \
-o sample1.bam variants.bam
samtools index sample1.bam
