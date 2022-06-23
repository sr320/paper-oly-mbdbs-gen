#!/bin/bash -ue
samtools sort -T deleteme -m 966367642 -@ 2 \
-o sample4.bam variants.bam
samtools index sample4.bam
