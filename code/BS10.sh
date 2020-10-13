#PBS -N HCSS_BS10
#PBS -S /bin/bash
#PBS -l nodes=1:ppn=16
#PBS -l walltime=100:00:00
#PBS -l mem=20GB
#PBS -o HCSS_BS10.stout
#PBS -e HCSS_BS10.err

cd /scratch/t.cri.ksilliman/CommonG_cp2/2019_Mapping/ANGSD_run/HCSS/Outlier

~/Downloads/BayeScan2.1/binaries/BayeScan2.1_linux64bits HCSS_Afilt32m70_01_pp90.bayescan \
-snp -threads 16 -n 100000 -pr_odds 10 -o HCSS_Afilt32m70_01_pp90-BS-po10

