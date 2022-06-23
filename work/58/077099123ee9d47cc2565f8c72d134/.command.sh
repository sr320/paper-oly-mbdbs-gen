#!/bin/bash -ue
samtools sort -T deleteme -m 966367642 -@ 2 \
-o sample5.bam variants.bam
samtools index sample5.bam
