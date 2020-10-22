#!/bin/bash

#SBATCH --job-name=test_SS17_filter
#SBATCH --mem=24G 
#SBATCH --ntasks=8 
#SBATCH -e test_SS17_filter_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

#/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -bam SS17_bamlist.txt -doSaf 1 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -minMapQ 30 -minQ 20 -GL 1 -P 8 -out SS17_bams_filter 

#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS SS17_bams_filter.saf.idx -P 8 -r chr1:1-100000 > SS17_bams_nofold_filter_chr1.sfs                                         
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS saf2theta SS17_bams_filter.saf.idx -outname SS17_bams_nofold_filter_chr1 -sfs SS17_bams_nofold_filter_chr1.sfs                        
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat SS17_bams_nofold_filter_chr1.thetas.idx                                                                  
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat SS17_bams_nofold_filter_chr1.thetas.idx -win 50000 -step 10000 -outnames SS17_bams_nofold_filter_chr1.thetasWindow.gz
# 
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS SS17_bams_filter.saf.idx -P 8 -r chr1:1-100000 -fold 1 > SS17_bams_fold_filter_chr1.sfs                                         
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS saf2theta SS17_bams_filter.saf.idx -outname SS17_bams_fold_filter_chr1 -sfs SS17_bams_fold_filter_chr1.sfs -fold 1                        
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat SS17_bams_fold_filter_chr1.thetas.idx                                                                  
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat SS17_bams_fold_filter_chr1.thetas.idx -win 50000 -step 10000 -outnames SS17_bams_fold_filter_chr1.thetasWindow.gz
 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS SS17_bams_filter.saf.idx -P 8 -sites sites.txt -nSites 2972147 > SS17_bams_nofold_vcf_sites_filter.sfs
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS saf2theta SS17_bams_filter.saf.idx -outname SS17_bams_nofold_vcf_sites_filter -sfs SS17_bams_nofold_vcf_sites_filter.sfs
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat SS17_bams_nofold_vcf_sites_filter.thetas.idx 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat SS17_bams_nofold_vcf_sites_filter.thetas.idx -win 50000 -step 10000 -outnames SS17_bams_nofold_vcf_sites_filter.thetasWindow.gz
   
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS SS17_bams_filter.saf.idx -P 8 -fold 1 -sites sites.txt -nSites 2972147 > SS17_bams_fold_vcf_sites_filter.sfs
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS saf2theta SS17_bams_filter.saf.idx -outname SS17_bams_fold_vcf_sites_filter -sfs SS17_bams_fold_vcf_sites_filter.sfs -fold 1
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat SS17_bams_fold_vcf_sites_filter.thetas.idx 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat SS17_bams_fold_vcf_sites_filter.thetas.idx -win 50000 -step 10000 -outnames SS17_bams_fold_vcf_sites_filter.thetasWindow.gz
  
#command to run: sbatch script_test_SS17_filter.sh