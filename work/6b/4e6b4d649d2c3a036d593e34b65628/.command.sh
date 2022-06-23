#!/bin/bash -ue
change_sam_queries.py -Q -T 16 -t . -G calmd.bam clustering.bam || exit $?
find -mindepth 1 -maxdepth 1 -type d -exec rm -r {} \;
