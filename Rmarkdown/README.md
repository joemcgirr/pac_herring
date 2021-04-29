## AF_shifts
Measure differences in allele frequency between sampling periods (collected in 1991, 1996, 2006/7, and 2017).
## demography
Demographic inference in Pacific herring populations using unlinked biallelic SNPs and the [moments pipeline](https://github.com/dportik/moments_pipeline).
## drafts
Old stuff, but maybe useful.
## fastq_to_vcf
Generate multiple filtered `.vcf` files containing variant data for 892 Pacific herring from ~2200 raw `.fastq` files (low coverage genomes (1.2x) paired-end reads).
## inversions
Use the [GenotypePlot package](https://github.com/JimWhiting91/genotype_plot) to visualize variation on chromosomes with inversions.
## LD_Ne
Estimate long-term effective population size (Ө = 4Neµ) and plot Ne for each population. Plot short-term estimates of Ne estimated by [Vince Buffalo](https://vincebuffalo.com/). Measure linkage disequilibrium with PLINK and plots LD decay.
## LoF
Use an Ensembl tool [Variant Effect Predictor](https://www.ensembl.org/vep) to identify putative loss-of-function alleles and examine their frequency in each population. Also checks the frequency of LoF alleles within genes that are in the aryl hydrocarbon signalling pathway. 
## popgen_stats
Estimate genome-wide summary statistics (nucleotide diversity, Tajima's D, Fst, Dxy, population branch statistic) from a `.vcf` with [ANGSD](http://www.popgen.dk/angsd/index.php/ANGSD) and visualize results.
## population_structure
Perform population structure analyses with [PCAngsd](http://www.popgen.dk/software/index.php/PCAngsd),
[PLINK PCA](https://www.cog-genomics.org/plink/1.9/strat), [NGSadmix](http://www.popgen.dk/software/index.php/NgsAdmix), and [popVAE](https://github.com/kr-colab/popvae) and vizualize results.
