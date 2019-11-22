# paper-oly-mbdbs-gen

## analyses

### 2bRAD

- Files that can be used as relatedness matrix for MACAU: HSmbdsamples_rab.txt and mbdsamples_rab.txt. File starting with HS is generated from an ANGSD run using only HC/SS samples, the other is a run using HC/SS/NF samples. The two files are very tightly correlated so should not matter much.
- HCSS_Afilt32m70_01_pp90_m75_BSouts.vcf: VCF file of 7 SNPs determined to be outliers by Bayescan with FDR < 0.1 and prior of 10.
- GWAS_\*.pvalues: pvalues from GWAS of either weight or width for each SNP  
- HCSS_sfsm70_Per\*Fst.csv: CSV files with pairwise FST values > 0 on either a per site or per gene basis.  

## data 
- HCSS_Afilt32m70_01_pp90.vcf: HC and SS populations, all SNPS with MAF > 1% and a genotype probobility of > 90%; \_m75.recode.vcf is filtered for SNPs genotyped in at least 75% of individuals
- Afilt32m70_01_pp75.vcf: 3 populations, all SNPS with MAF > 1% and a genotype probobility of > 75%; \_m75.recode.vcf is filtered for SNPs genotyped in at least 75% of individuals

