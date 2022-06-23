#!/bin/bash -ue
samtools sort -T deleteme -m 966367642 -@ 2 \
-o sample6.bam variants.bam
samtools index sample6.bam
