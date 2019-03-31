#!/bin/bash
## Job Name
#SBATCH --job-name=oly-mbd
## Allocation Definition
#SBATCH --account=coenv
#SBATCH --partition=coenv
## Resources
## Nodes (We only get 1, so this is fixed)
#SBATCH --nodes=1
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=00-100:00:00
## Memory per node
#SBATCH --mem=100G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sr320@uw.edu
## Specify the working directory for this job
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/2019/0327
 
 
 
# Directories and programs
wd=$(pwd)
bismark_dir="/gscratch/srlab/programs/Bismark-0.21.0"
bowtie2_dir="/gscratch/srlab/programs/bowtie2-2.3.4.1-linux-x86_64/"
samtools="/gscratch/srlab/programs/samtools-1.9/samtools"
reads_dir="/gscratch/srlab/sr320/data/olurida-bs/"
 
 
 
source /gscratch/srlab/programs/scripts/paths.sh
 
 
find ${reads_dir}*_s456_trimmed.fq.gz \
| xargs basename -s _s456_trimmed.fq.gz | xargs -I{} ${bismark_dir}/bismark \
--path_to_bowtie ${bowtie2_dir} \
-genome /gscratch/srlab/sr320/data/olurida-genomes/v081 \
-p 14 \
--non_directional \
${reads_dir}/{}_s456_trimmed.fq.gz 
 
 
 
# -s for SE -p for PE 
${bismark_dir}/deduplicate_bismark \
--bam -s \
*.bam
 
 
${bismark_dir}/bismark_methylation_extractor \
--bedGraph --counts --scaffolds \
--multicore 14 \
*deduplicated.bam
 
 
 
# Bismark processing report
 
${bismark_dir}/bismark2report
 
#Bismark summary report
 
${bismark_dir}/bismark2summary
 
 
 
# Sort files for methylkit and IGV
 
find *deduplicated.bam | \
xargs basename -s .bam | \
xargs -I{} ${samtools} \
sort --threads 28 {}.bam \
-o {}.sorted.bam
 
# Index sorted files for IGV
# The "-@ 16" below specifies number of CPU threads to use.
 
find *.sorted.bam | \
xargs basename -s .sorted.bam | \
xargs -I{} ${samtools} \
index -@ 28 {}.sorted.bam
