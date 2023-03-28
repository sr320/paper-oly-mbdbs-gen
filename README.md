# Data and Code accompanying the manuscript
## _Epigenetic and genetic population structure is coupled in a marine invertebrate_

Repository structure
- `analyses` - code output, organized by sub directories
- `code` - code used including knitr products
- `data` - files associated with annotation, genetics, and methylation
- `genome annot` - code and fasta files used for genome annotation
- `genome-features` - genome feature tracks for visualization and analysis (eg _bedtools_)
- `protocols` - protocol for 2bRAD library prep

---

_Below are select files in the repository distinctly referenced in the manuscript_



## Genome Assembly    
- PBJelly code `genome-annot/20171130_emu_pbjelly.ipynb`
- Maker custom repeat library `genome-annot/Ostrea_lurida_v081-families.fa`
- transcriptome assembly `genome-annot/Olurida_transcriptome_v3.fasta`
- _Crassostrea gigas_ proteins `genome-annot/GCA_000297895.1_oyster_v9_protein.faa`
- _Crassostrea virginica_ proteins `genome-annot/GCF_002022765.2_C_virginica-3.0_protein.faa`

## Genetic Analyses
- Meyer 2bRAD protocol `protocols/2bRAD_11Aug2015.pdf`    
    _2bRAD_ `analyses`     
- Files for relatedness matrix for MACAU: HSmbdsamples_rab.txt and mbdsamples_rab.txt. File starting with HS is generated from an ANGSD run using only HC/SS samples, the other is a run using HC/SS/NF samples. The two files are very tightly correlated so should not matter much.
- HCSS_Afilt32m70_01_pp90_m75_BSouts.vcf: VCF file of 7 SNPs determined to be outliers by Bayescan with FDR < 0.1 and prior of 10.
- GWAS_\*.pvalues: pvalues from GWAS of either weight or width for each SNP  
- HCSS_sfsm70_Per{Site,Gene}Fst.csv: CSV files with pairwise FST values > 0 on either a per site or per gene basis.  
    _2bRAD_ `data`  
- HCSS_Afilt32m70_01_pp90.vcf: the primary genetic data used in the manuscript, HC and SS populations, all SNPS with MAF > 1% and a genotype probobility of > 90%; \_m75.recode.vcf is filtered for SNPs genotyped in at least 75% of individuals
- Afilt32m70_01_pp75.vcf: 3 populations, all SNPS with MAF > 1% and a genotype probobility of > 75%; \_m75.recode.vcf is filtered for SNPs genotyped in at least 75% of individuals

## DNA Methylation  

### Methylation code  
- [00-Bismark.sh](00-Bismark.sh) - Bismark code 
- [01-methylkit.Rmd](01-methylkit.Rmd)  -  methylKit code plus additional analyses. Includes initial look at methylation data, filtering for coverage, incorporate loci that were very likely unmethylated in one population but highly methylated in the other, generating a final methylation dataset for comparative analysis among populations, conducting differential methylation analysis, PCA, and generating distance matrix from % methylation for integration with genetic data.  
- [2-Generating-gene-region-feature-files.Rmd](code\02-Generating-gene-region-feature-files.Rmd)  -  Bedtools to expand genome feature files to include 2kb up/downstream of features.  
- [03-General-Methylation-Patterns.Rmd](03-General-Methylation-Patterns.Rmd) -  Uses all data from both populations to characterize methylation in the Ostrea lurida genome. Includes calling methylation status & filtering for coverage, using bedtools to identify genome features containing methylated CpGs, testing for differences among distributions of methylated CpGs vs. all CpGs. Also includes methylation island analysis code that was not used for paper.  
- [04-DMG-analysis.Rmd](04-DMG-analysis.Rmd)  -  Differentially methylated gene analysis among populations using binomial GLMs, gene annotation and enrichment analysis, overlap among DMGs and DMLs, Pst calcs at the gene level.  Contains lots of extraneous code to identify DMGs and run Pst using various thresholds for the min. number of methylated loci per gene.  
- [05-Annotations.Rmd](code/05-Annotations.Rmd)  -  Use bedtools and enrichment analyses to characterize where differentially methylated loci (DMLs) are located in genome. Includes extraneous code annotating "MACAU" loci (i.e. Size associated Loci, SALs).  
- [06-Meth-Pst-bins](code/06-Meth-Pst-bins)  -  Calculate methylation Pst for genome bins. 10kb bins were used in paper, but code also contains extraneous code for 1kb bins.  

### Methylation analyses subdirectories     
- [analyses/methylation/](analyses/methylation/) - Contains output files primarily from the `01-methylkit.Rmd` notebook relevant to comparative methylation analysis (but not including DML and DMG analyses).  
- [analyses/methylation-genome-characteristics/](analyses/methylation-genome-characteristics/) - Contains output files primarily from the `03-General-Methylation-Patterns.Rmd` notebook relevant to characterizing methylation in the Ostrea lurida genome.  
- [analyses/DMGs/](analyses/DMGs/)  -  Contains output files primarily from the `04-DMG-analysis.Rmd` notebook relevant to identifying differentially methylated genes and their functions.  
- [analyses/DMLs/](analyses/DMLs/)  - Contains output files primarily from the `01-methylkit.Rmd` and `05-Annotations.Rmd` notebooks relevant to differentially methylated loci and their functions.  

### Methylation analyses output files   
- [all_methylated_5x](analyses/methylation-genome-characteristics/R-objects/all_methylated_5x) & [all_unmethylated_5x](analyses/methylation-genome-characteristics/R-objects/all_unmethylated_5x) - R objects containing loci in the O. lurida genome that are methhylated and unmethylated, respectively, used to characterize methylation patterns for the species / draft genome.  
- [methylated-<_feature_>.bed](analyses/methylation-genome-characteristics/methylated-<_feature_>.bed) - Bed files containing locations of methylated loci, where _feature_ is gene, gene2kb, 2kbflank-up, 2kbflank-down, exon, CDS, mRNA, TE, or ASV.  
- [meth_filter](/analyses/methylation/R-objects/meth_filter) - methylBase object containing coverage, numCs, and numTs for each sample for the final set of filtered loci used in comparative analyses.  
- [perc.meth](analyses/methylation/R-objects/perc.meth) - Percent methylation matrix (rows=loci, columns=sample) used in comparative analyses.  
- [percent-methylation-filtered.tab](analyses/methylation/percent-methylation-filtered.tab) - % methylation of loci filtered at 5x by sample number used in comparative analyses.   
- [myDiff25p](analyses/DMLs/R-objects/myDiff25p), [dml25_counts](analyses/DMLs/R-objects/dml25_counts), [myDiff25p.tab](analyses/DMLs/myDiff25p.tab), and [dml25.bed](analyses/DMLs/dml25.bed) - differentially methylated loci (DMLs) among populations using min 25% difference   
- [dist.manhat.csv](analyses/methylation/dist.manhat.csv) and [dist.manhat.DMLs.csv](analyses/methylation/dist.manhat.DMLs.csv) - Manhattan distance matrices generated from % methylation matrices using all methylation data and differentially methylated loci, respectively.  
- [PCA.filtered](analyses/methylation/R-objects/PCA.filtered) - PCA R object representing global methylation patterns & differences among populations (uses all loci after filtering)  
- [perc_meth_bins_10kb_Pst](analyses/methylation/R-objects/perc_meth_bins_10kb_Pst) and [Pst_bins_10kb.tab](analyses/methylation/Pst_bins_10kb.tab)- Pst calculation results for random 10kb bins that contain both genetic and methylation data.  
- [DMGs_2kbslop](analyses/DMGs/R-objects/DMGs_2kbslop) and [DMGs_2kbslop_annotated.tab](analyses/DMGs/DMGs_2kbslop_annotated.tab) - Differentially methylated genes (DMGs) among ppoulations.  


## Archived files  
Several directories contain `archive/` subdirectories, which contain code and results from analyses that were not ultimately needed for the paper.  For instance, we performed a [MACAU](https://www.xzlab.org/software/macau/MACAUmanual.pdf) analysis to identify methylated loci associated with oyster size ("Size associated loci", or "SALs"), but this was not included in our publication. NOTE: some MACAU-relevant code also remains in non-archived notebooks (e.g. in the 05-Annotations.Rmd notebook).  
