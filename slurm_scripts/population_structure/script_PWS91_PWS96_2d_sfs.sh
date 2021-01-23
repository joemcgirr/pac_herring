#!/bin/bash

#SBATCH --job-name=PWS91_PWS96_2d_sfs
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e PWS91_PWS96_2d_sfs_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/PWS91.saf.idx /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/PWS96.saf.idx -fold 1 -P 4 > /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/maf05/folded_PWS91_PWS96.sfs 
/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/PWS91.saf.idx /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/PWS96.saf.idx -P 4 > /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/maf05/unfolded_PWS91_PWS96.sfs 


#command to run: sbatch script_PWS91_PWS96_2d_sfs.sh