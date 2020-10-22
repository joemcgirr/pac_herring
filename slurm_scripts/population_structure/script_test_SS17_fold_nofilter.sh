#!/bin/bash

#SBATCH --job-name=test_SS17_fold_nofilter
#SBATCH --mem=8G 
#SBATCH --ntasks=8 
#SBATCH -e test_SS17_fold_nofilter_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS SS17_bams.saf.idx -P 8 -r chr1:1-100000 -fold 1 > SS17_bams_fold_nofilter.sfs                                         
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS saf2theta SS17_bams.saf.idx -outname SS17_bams_fold_nofilter -sfs SS17_bams_fold_nofilter.sfs -fold 1                        
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat SS17_bams_fold_nofilter.thetas.idx                                                                  
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat SS17_bams_fold_nofilter.thetas.idx -win 50000 -step 10000 -outnames SS17_bams_fold_nofilter.thetasWindow.gz

#command to run: sbatch script_test_SS17_fold_nofilter.sh