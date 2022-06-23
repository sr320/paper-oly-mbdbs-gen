#!/bin/bash -ue
samtools sort -T deleteme -m 966367642 -@ 2 \
-o sorted.bam sample3.bam || exit $?
samtools calmd -b sorted.bam genome.fa 1> calmd.bam 2> /dev/null && rm sorted.bam
samtools index calmd.bam
