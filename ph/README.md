


NOTE: 

- In general, most analyses use the master .vcf generated with GATK
  `ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf` 
  available [here](https://osf.io/3cmkr/)
- 'maf05' refers to this master .vcf that has a minor allele frequency 
  threshold > 0.05. However, there are other .vcfs with different 
  thresholds
- 'donwsample41' refers to analyses that used .bam files + angsd
  rather than the master .vcf + angsd
  
Description of files found in `/ph` available on OSF
https://osf.io/3cmkr/

---
# annotations
Gene feature files for the [Atlantic herring reference genome on Ensembl Ch_v2.0.2](https://uswest.ensembl.org/Clupea_harengus/Info/Index)

---

# dxy
[see here for workflow](https://htmlpreview.github.io/?https://github.com/joemcgirr/pac_herring/blob/master/Rmarkdown/popgen_stats/popgen_stats.html#5_Dxy)
## maf05
maf files are minor allele frequencies estimated with angsd using genotype likelihoods from master vcf.
FARM path: 
### windows
dxy calculated in 50 kb sliding windows with 10kb steps
---

# familiarize
Metadata for samples, troubleshooting sample mislabeling, quality control metrics
## multiqc_data
QC results for .`fastq` and `.bam` using [multiqc](https://multiqc.info/)
### wgsMetrics
QC results for each sample using Picard tools.
[see here for workflow](https://htmlpreview.github.io/?https://htmlpreview.github.io/?https://github.com/joemcgirr/pac_herring/blob/master/Rmarkdown/fastq_to_vcf/fastq_to_vcf.html#5_Interrogate_alignment_files)

---
# figs
---
# freqs
---
# fst_pbs
---
# LoF
---
# moments
---
# mushi
---
# ngsadmix
---
# pcangsd
---
# plink
---
# popvae
---
# sfs
---
# thetas
---
# vcfs
---
# vince



