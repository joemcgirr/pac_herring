#!/bin/bash

#SBATCH --job-name=TB17_thetas_vcf
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e TB17_thetas_vcf_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS saf2theta /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/TB17.saf.idx -outname /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/thetas/TB17 -fold 1 -sfs /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/TB17_folded.sfs 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/thetas/TB17.thetas.idx 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/thetas/TB17.thetas.idx -win 50000 -step 10000 -outnames /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/thetas/TB17_50kb_win_10kb_step 


#run: sbatch script_TB17_thetas_vcf.sh