


## Description of files found in `/ph` available on OSF https://osf.io/3cmkr/

---

```
ph
│
└───annotations
```
# annotations
Gene feature files for the [Atlantic herring reference genome on Ensembl Ch_v2.0.2](https://uswest.ensembl.org/Clupea_harengus/Info/Index)

---

```
ph
│
└───dxy
│   │
│   └───maf05
|       |
|       └───windows

```
# dxy
[See here for workflow](https://htmlpreview.github.io/?https://github.com/joemcgirr/pac_herring/blob/master/Rmarkdown/popgen_stats/popgen_stats.html#5_Dxy)
### maf05
maf files are minor allele frequencies estimated with angsd using genotype likelihoods from master `.vcf`   
### windows
dxy calculated in 50 kb sliding windows with 10kb steps.

---

```
ph
│
└───familiarize
│   │
│   └───multiqc_data
|       |
|       └───wgsMetrics

```
# familiarize
Metadata for samples, troubleshooting sample mislabeling, quality control metrics.
### multiqc_data
QC results for .`fastq` and `.bam` using [multiqc](https://multiqc.info/)
#### wgsMetrics
QC results for each sample using [Picard tools](https://broadinstitute.github.io/picard/)   
[See here for workflow](https://htmlpreview.github.io/?https://github.com/joemcgirr/pac_herring/blob/master/Rmarkdown/fastq_to_vcf/fastq_to_vcf.html#5_Interrogate_alignment_files)

---

```
ph
│
└───freqs
│   │
│   └───persite
|   |
|   └───window   

```
# freqs
Allele frequencies pulled directly from the AF INFO from population `.vcf`   
AFs from hard calls, not genotype likelihoods (for those, see .ph/dxy/maf05/.)   
[See here for workflow](https://htmlpreview.github.io/?https://github.com/joemcgirr/pac_herring/blob/master/Rmarkdown/AF_shifts/AF_shifts.html)
### persite
Allele frequency differences between sampling periods within PWS, SS, and TB population.   
These are acrsine transformed AF differences.
### windows
AF differences averaged across sliding windows (the 1mb windows are more informative than 50kb)

---

```
ph
│
└───fst_pbs
│   │
│   └───maf05
   

```
# fst_pbs
Fst and population branch statistic measured for three populations using 50kb sliding windows and 10kb steps.    
[See here for workflow](https://htmlpreview.github.io/?https://github.com/joemcgirr/pac_herring/blob/master/Rmarkdown/popgen_stats/popgen_stats.html#4_Fst_and_Population_Branch_Statistic)

### maf05
File name: `fst_pbs_50kb_win_10kb_step_folded_BC17_WA17_CA17.txt`   
The header : `region	chr	midPos	Nsites	Fst01	Fst02	Fst12	PBS0	PBS1	PBS2`   
BC17 = 0
WA17 = 1
CA17 = 2

---

```
ph
│
└───LoF
│   │
│   └───maf05
   

```
# LoF
Input and output for Ensemble's Variant Effect Predictor.   
[See here for workflow](https://htmlpreview.github.io/?https://github.com/joemcgirr/pac_herring/blob/master/Rmarkdown/LoF/LoF.html)
### maf05
Minor allele frequencies for each population. These tables are the same as the ones in `ph/dxy/maf05/` they only differ by one column that is not used for analyses.

---

```
ph
│
└───moments
│   │
│   └───downsample
|   |   |
|   |   └───chr1_5mb
|   |       |
|   |       └───PWS17_SS17
|   |       └───PWS17_TB17
|   |       └───SS17_TB17
│   │
│   └───snakemake

```
# moments
Folded 2D sfs for EXPLORATORY demographic inference using the [moments pipeline](https://github.com/dportik/moments_pipeline)   
[See here for workflow](https://htmlpreview.github.io/?https://github.com/joemcgirr/pac_herring/blob/master/Rmarkdown/demography/demography.html)

### downsample
2D sfs plotted using dadi (`.png` images) 
### chr1_5mb
Input and output for the moments pipline. Analyses performed for 3 populations. I randomly downsampled to include 41 samples of each population for each folded sfs. The sfs were generated using `.bam` files directly input to angsd, but only for the first 5mb of chromosome 1. The moments pipeline uses the `*_dadi_snp_data` as input. 

### PWS17_SS17, PWS17_TB17, SS17_TB17
Contain the config files (`moments_Run_Optimizations.py` and `Optimize_Functions.py`) to run a simple demographic model for each population pair (single split with gene flow) and output files (`V5_Number*`).

### snakemake
simple snakemake workflow to generate 2D sfs for population pairs.

---

```
ph
│
└───ngsadmix
│   │
│   └───clumpak_results
│   │
│   └───qfiles

```
# ngsadmix
Output from [ngsadmix](http://www.popgen.dk/software/index.php/NgsAdmix) and [clumpak](http://clumpak.tau.ac.il/results.html?jobId=1612995364)   
[See here for workflow](https://htmlpreview.github.io/?https://github.com/joemcgirr/pac_herring/blob/master/Rmarkdown/population_structure/population_strucutre.html#63_NGSAdmix)
### clumpak_results
Input files to estimate best k
### qfiles
Files to plot structure with varying k

---

```
ph
│
└───pcangsd

```
# pcangsd
Output file from [pcangsd](http://www.popgen.dk/software/index.php/PCAngsd)   
[See here for workflow](https://htmlpreview.github.io/?https://htmlpreview.github.io/?https://github.com/joemcgirr/pac_herring/blob/master/Rmarkdown/population_structure/population_strucutre.html#61_PCAngsd)

---

```
ph
│
└───plink
|   |
|   └───pops

```
# plink
PCA and linkage disequilibrium outputs   
`plates_1_through_5_rm.txt` = samples in master `.vcf` and `.ped`   
`*indep_pairwise_100_10_0.8.ld` = LD for `.vcf` with all samples in `plates_1_through_5_rm.txt`   
`.eigenval` and `.eigenvec` from PCA for 2 `.vcf` files with different minor allele frequency thresholds (maf > 0.01 or 0.05)   
[See here for PCA workflow](https://htmlpreview.github.io/?https://github.com/joemcgirr/pac_herring/blob/master/Rmarkdown/population_structure/population_strucutre.html#62_PLINK_PCA)   
[See here for LD workflow](https://htmlpreview.github.io/?https://github.com/joemcgirr/pac_herring/blob/master/Rmarkdown/Ne_LD/Ne_LD.html#4_Linkage_Disequilibrium)
### pops 
LD measured for each population

---

```
ph
│
└───popvae

```
# popvae
Output files from [popvae](https://github.com/kr-colab/popvae)   
[See here for workflow](https://htmlpreview.github.io/?https://github.com/joemcgirr/pac_herring/blob/master/Rmarkdown/population_structure/population_strucutre.html#64_Popvae)

---

```
ph
│
└───sfs
│   │
│   └───downsample41
|   |   |
|   |   └───folded
|   |   |   |
|   |   |   └───chunks
|   |   |
|   |   └───unfolded
|   |       |
|   |       └───chunks
|   |  
│   └───light_snp_call
|   |  
│   └───maf01
|   |  
│   └───maf05

```
# sfs
1D site frequency spectra for populations estimated using 3 strategies.   
To visualize results of each strategy, [see here](https://github.com/joemcgirr/pac_herring/blob/master/Rmarkdown/demography/sfs.R)
### downsample41
In order to include invariant sites, I run angsd directly with `.bam` files to create an `.saf` file for each population. Due to memory constraints, I randomly down sample the number of input `.bam` files to match the lowest population sample size (n = 41). I use the -nSites 100000000 flag due to memory limits. This breaks up genome into 7 chunks and gives you seven lines in the output `.sfs`. I sum columns to make final sfs. These sfs look the prettiest of the 3 strategies, but overestimate the number of singletons and doubletons.   
[See here for workflow](https://htmlpreview.github.io/?https://github.com/joemcgirr/pac_herring/blob/master/Rmarkdown/popgen_stats/popgen_stats.html#7_Nucleotide_diversity)
### light_snp_call
In an attempt to address the excess of singletons, I tried a light snp calling with angsd before estimating sfs.
### maf01 and maf05
These sfs were generated from the GATK `.vcf` files with different minor allele frequency thresholds (maf > 0.01 or 0.05). The genotype likelihoods from the `.vcf` are the input for angsd (as opposed to `.bam` files as in `downsample41`). But because I use a minor allele frequency cutoff, the sfs are missing singletons, doubletons, etc.    
[See here for workflow](https://htmlpreview.github.io/?https://github.com/joemcgirr/pac_herring/blob/master/Rmarkdown/popgen_stats/popgen_stats.html#42_Use_realSFS_to_make_folded_and_unfolded_SFS_for_each_population)

---

```
ph
│
└───thetas
│   │
│   └───downsample_41
|   |   |
|   |   └───folded
|   |   |
|   |   └───unfolded
│   │
│   └───vcf
|   |   |
|   |   └───maf05

```
# thetas
Thetas estimated using sfs generated by angsd. Mainly used for nucleotide diversity and Tajima's D. It is important to account for invariant sites when estimating thetas. Therefore, use results in `/downsample_41` instead of `/vcf`
### downsample_41
In order to include invariant sites, I run angsd directly with `.bam` files to create an `.saf` file for each population. Due to memory constraints, I randomly down sample the number of input `.bam` files to match the lowest population sample size (n = 41). Thetas were estimated across 50kb sliding windows with 10 steps.   
[See here for workflow](https://htmlpreview.github.io/?https://github.com/joemcgirr/pac_herring/blob/master/Rmarkdown/popgen_stats/popgen_stats.html#7_Nucleotide_diversity)
### vcf/maf05
The genotype likelihoods from the master `.vcf` are the input for angsd (as opposed to `.bam` files as in `downsample41`). However, this overestimates nucleotide diversity because missing and invariant sites are ignored. I only include these for comparison. Thetas were estimated across 50kb sliding windows with 10 steps. 

---

```
ph
│
└───vcfs
|   |
|   └───chrs

```
# vcfs
Zipped `.vcf` files generated by GATK with genotype likelihoods. There are two main files with  different minor allele frequency thresholds (maf > 0.01 or 0.05). There is another larger vcf without a maf threshold on FARM (`/home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5.vcf.gz`). There are also `.vcf` files for each population (`/home/jamcgirr/ph/data/vcfs/split_pops`).  
`sample_metadata.txt` has metadata for samples in vcf.   
[See here for workflow](https://htmlpreview.github.io/?https://github.com/joemcgirr/pac_herring/blob/master/Rmarkdown/fastq_to_vcf/fastq_to_vcf.html)

---
# vince
Vince Buffalo's short term estimates of effective population size based on variance in the temporal changes of allele frequency. 

---

---

---

IMPORTANT NOTES: 

- In general, most analyses use the master .vcf generated with GATK
  `ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf` 
  available [here](https://osf.io/3cmkr/)
- 'maf05' refers to this master .vcf that has a minor allele frequency 
  threshold > 0.05. However, there are other .vcfs with different 
  thresholds
- 'donwsample41' refers to analyses that used .bam files + angsd
  rather than the master .vcf + angsd

---


