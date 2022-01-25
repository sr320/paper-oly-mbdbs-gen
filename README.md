### Data and Code for the manuscript
### _Epigenetic and genetic population structure is coupled in a marine invertebrate_







---


## Methods

**Genome Assembly**    
- PBJelly code `genome-annot/20171130_emu_pbjelly.ipynb`
- Maker custom repeat library `genome-annot/Ostrea_lurida_v081-families.fa`
- transcriptome assembly `genome-annot/Olurida_transcriptome_v3.fasta`
- _Crassostrea gigas_ proteins `genome-annot/GCA_000297895.1_oyster_v9_protein.faa`
- _Crassostrea virginica_ proteins `genome-annot/GCF_002022765.2_C_virginica-3.0_protein.faa`

**Genetic Analyses**
- Meyer 2bRAD protocol `protocols/2bRAD_11Aug2015.pdf`




## analyses

### 2bRAD

- Files that can be used as relatedness matrix for MACAU: HSmbdsamples_rab.txt and mbdsamples_rab.txt. File starting with HS is generated from an ANGSD run using only HC/SS samples, the other is a run using HC/SS/NF samples. The two files are very tightly correlated so should not matter much.
- HCSS_Afilt32m70_01_pp90_m75_BSouts.vcf: VCF file of 7 SNPs determined to be outliers by Bayescan with FDR < 0.1 and prior of 10.
- GWAS_\*.pvalues: pvalues from GWAS of either weight or width for each SNP  
- HCSS_sfsm70_Per{Site,Gene}Fst.csv: CSV files with pairwise FST values > 0 on either a per site or per gene basis.  

## data
- HCSS_Afilt32m70_01_pp90.vcf: HC and SS populations, all SNPS with MAF > 1% and a genotype probobility of > 90%; \_m75.recode.vcf is filtered for SNPs genotyped in at least 75% of individuals
- Afilt32m70_01_pp75.vcf: 3 populations, all SNPS with MAF > 1% and a genotype probobility of > 75%; \_m75.recode.vcf is filtered for SNPs genotyped in at least 75% of individuals
