#!/bin/bash

#SBATCH --job-name=TB91_TB96_TB06_fst_pbs_folded
#SBATCH --mem=8G 
#SBATCH --ntasks=1 
#SBATCH -e TB91_TB96_TB06_fst_pbs_folded_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/apps/angsd/misc/realSFS fst index /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/TB91.saf.idx /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/TB96.saf.idx /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/TB06.saf.idx -sfs /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/maf05/folded_TB91_TB96.sfs -sfs /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/maf05/folded_TB91_TB06.sfs -sfs /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/maf05/folded_TB96_TB06.sfs -fold 1 -fstout /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/maf05/folded_TB91_TB96_TB06_persite 
/home/jamcgirr/apps/angsd/misc/realSFS fst stats2 /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/maf05/folded_TB91_TB96_TB06_persite.fst.idx -win 50000 -step 10000 > /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/maf05/fst_pbs_50kb_win_10kb_step_folded_TB91_TB96_TB06.txt 


#command to run: sbatch script_TB91_TB96_TB06_fst_pbs_folded.sh