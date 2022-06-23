#!/bin/bash -ue
samtools sort -T deleteme -m 966367642 -@ 4 \
-o sorted.bam sample4.bam || exit $?
samtools calmd -b sorted.bam genome.fa 1> calmd.bam 2> /dev/null && rm sorted.bam
samtools index calmd.bam
