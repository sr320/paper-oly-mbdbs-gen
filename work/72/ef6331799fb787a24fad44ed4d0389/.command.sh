#!/bin/bash -ue
samtools sort -T deleteme -m 966367642 -@ 2 \
-o sample3.bam variants.bam
samtools index sample3.bam
