#!/bin/bash

#SBATCH --job-name=test_SS17
#SBATCH --mem=20G 
#SBATCH --ntasks=8 
#SBATCH -e test_SS17_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

#/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -bam SS17_bamlist.txt -doSaf 1 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -GL 1 -P 8 -out SS17_bams 

/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS SS17_bams.saf.idx -P 8 -sites sites.txt -nSites 2972147 > SS17_bams_nofold_vcf_sites.sfs
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS saf2theta SS17_bams.saf.idx -outname SS17_bams_nofold_vcf_sites -sfs SS17_bams_nofold_vcf_sites.sfs
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat SS17_bams_nofold_vcf_sites.thetas.idx 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat SS17_bams_nofold_vcf_sites.thetas.idx -win 50000 -step 10000 -outnames SS17_bams_nofold_vcf_sites.thetasWindow.gz
   
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS SS17_bams.saf.idx -P 8 -fold 1 > SS17_bams_fold.sfs
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS saf2theta SS17_bams.saf.idx -outname SS17_bams_fold -sfs SS17_bams_fold.sfs -fold 1
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat SS17_bams_fold.thetas.idx 
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat SS17_bams_fold.thetas.idx -win 50000 -step 10000 -outnames SS17_bams_fold.thetasWindow.gz
  
#command to run: sbatch script_test_SS17.sh