#!/bin/bash -ue
change_sam_queries.py -Q -T 8 -t . calmd.bam variants.bam || exit $?
find -mindepth 1 -maxdepth 1 -type d -exec rm -r {} \;
