#!/bin/bash

#SBATCH --job-name=TB17_PWS17_WA17_fst_pbs_folded
#SBATCH --mem=8G 
#SBATCH --ntasks=1 
#SBATCH -e TB17_PWS17_WA17_fst_pbs_folded_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/apps/angsd/misc/realSFS fst index /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/TB17.saf.idx /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/PWS17.saf.idx /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/WA17.saf.idx -sfs /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/maf05/folded_TB17_PWS17.sfs -sfs /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/maf05/folded_TB17_WA17.sfs -sfs /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/maf05/folded_PWS17_WA17.sfs -fold 1 -fstout /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/maf05/folded_TB17_PWS17_WA17_persite 
/home/jamcgirr/apps/angsd/misc/realSFS fst stats2 /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/maf05/folded_TB17_PWS17_WA17_persite.fst.idx -win 50000 -step 10000 > /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/maf05/fst_pbs_50kb_win_10kb_step_folded_TB17_PWS17_WA17.txt 


#command to run: sbatch script_TB17_PWS17_WA17_fst_pbs_folded.sh