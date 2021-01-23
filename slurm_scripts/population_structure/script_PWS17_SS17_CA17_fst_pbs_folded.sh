#!/bin/bash

#SBATCH --job-name=PWS17_SS17_CA17_fst_pbs_folded
#SBATCH --mem=8G 
#SBATCH --ntasks=1 
#SBATCH -e PWS17_SS17_CA17_fst_pbs_folded_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/apps/angsd/misc/realSFS fst index /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/PWS17.saf.idx /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/SS17.saf.idx /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/CA17.saf.idx -sfs /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/maf05/folded_PWS17_SS17.sfs -sfs /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/maf05/folded_PWS17_CA17.sfs -sfs /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/maf05/folded_SS17_CA17.sfs -fold 1 -fstout /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/maf05/folded_PWS17_SS17_CA17_persite 
/home/jamcgirr/apps/angsd/misc/realSFS fst stats2 /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/maf05/folded_PWS17_SS17_CA17_persite.fst.idx -win 50000 -step 10000 > /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/maf05/fst_pbs_50kb_win_10kb_step_folded_PWS17_SS17_CA17.txt 


#command to run: sbatch script_PWS17_SS17_CA17_fst_pbs_folded.sh