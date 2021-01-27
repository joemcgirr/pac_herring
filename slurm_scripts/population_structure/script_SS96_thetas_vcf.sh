#!/bin/bash

#SBATCH --job-name=SS96_thetas_vcf
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e SS96_thetas_vcf_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS saf2theta /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/SS96.saf.idx -outname /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/thetas/SS96 -fold 1 -sfs /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/SS96_folded.sfs 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/thetas/SS96.thetas.idx 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/thetas/SS96.thetas.idx -win 50000 -step 10000 -outnames /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/thetas/SS96_50kb_win_10kb_step 


#run: sbatch script_SS96_thetas_vcf.sh