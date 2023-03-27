### Data and Code accompanying the manuscript
### _Epigenetic and genetic population structure is coupled in a marine invertebrate_

Repository structure
- `analyses` - code output, organized by sub directories
- `code` - code used including knitr products
- `data` - files associated with annotation, genetics, and methylation
- `genome annot` - code and fasta files used for genome annotation
- `genome-features` - genome feature tracks for visualization and analysis (eg _bedtools_)
- `protocols` - protocol for 2bRAD library prep

---

_Below are select files in the repository distinctly referenced in the manuscript_



**Genome Assembly**    
- PBJelly code `genome-annot/20171130_emu_pbjelly.ipynb`
- Maker custom repeat library `genome-annot/Ostrea_lurida_v081-families.fa`
- transcriptome assembly `genome-annot/Olurida_transcriptome_v3.fasta`
- _Crassostrea gigas_ proteins `genome-annot/GCA_000297895.1_oyster_v9_protein.faa`
- _Crassostrea virginica_ proteins `genome-annot/GCF_002022765.2_C_virginica-3.0_protein.faa`

**Genetic Analyses**
- Meyer 2bRAD protocol `protocols/2bRAD_11Aug2015.pdf`    
    _2bRAD_ `analyses`     
- Files for relatedness matrix for MACAU: HSmbdsamples_rab.txt and mbdsamples_rab.txt. File starting with HS is generated from an ANGSD run using only HC/SS samples, the other is a run using HC/SS/NF samples. The two files are very tightly correlated so should not matter much.
- HCSS_Afilt32m70_01_pp90_m75_BSouts.vcf: VCF file of 7 SNPs determined to be outliers by Bayescan with FDR < 0.1 and prior of 10.
- GWAS_\*.pvalues: pvalues from GWAS of either weight or width for each SNP  
- HCSS_sfsm70_Per{Site,Gene}Fst.csv: CSV files with pairwise FST values > 0 on either a per site or per gene basis.  
    _2bRAD_ `data`  
- HCSS_Afilt32m70_01_pp90.vcf: the primary genetic data used in the manuscript, HC and SS populations, all SNPS with MAF > 1% and a genotype probobility of > 90%; \_m75.recode.vcf is filtered for SNPs genotyped in at least 75% of individuals
- Afilt32m70_01_pp75.vcf: 3 populations, all SNPS with MAF > 1% and a genotype probobility of > 75%; \_m75.recode.vcf is filtered for SNPs genotyped in at least 75% of individuals

**DNA Methylation**   
- Bismark code `code\00-Bismark.sh`
- methylKit code `code\01-methylkit.Rmd`  -  Includes initial look at methylation data, filtering for coverage, incorporate loci that were very likely unmethylated in one population but highly methylated in the other, generating a final methylation dataset for comparative analysis among populations, conducting differential methylation analysis, PCA, and generating distance matrix from % methylation for integration with genetic data.  
- `code\002-Generating-gene-region-feature-files.Rmd`  -  Bedtools to expand genome feature files to include 2kb up/downstream of features.  
- `code\003-General-Methylation-Patterns.Rmd` -  Uses all data from both populations to characterize methylation in the Ostrea lurida genome. Includes calling methylation status & filtering for coverage, using bedtools to identify genome features containing methylated CpGs, testing for differences among distributions of methylated CpGs vs. all CpGs. Also includes methylation island analysis code that was not used for paper.  
- `code\004-DMG-analysis.Rmd`  -  Differentially methylated gene analysis among populations using binomial GLMs, gene annotation and enrichment analysis, overlap among DMGs and DMLs, Pst calcs at the gene level.  Contains lots of extraneous code to identify DMGs and run Pst using various thresholds for the min. number of methylated loci per gene.  
- `05-Annotations.Rmd`  -  Use bedtools and enrichment analyses to characterize where differentially methylated loci (DMLs) are located in genome. Includes extraneous code annotating "MACAU" loci (i.e. Size associated Loci, SALs).  
- `06-Meth-Pst-bins`  -  Calculate methylation Pst for genome bins. 10kb bins were used in paper, but code also contains extraneous code for 1kb bins.  
