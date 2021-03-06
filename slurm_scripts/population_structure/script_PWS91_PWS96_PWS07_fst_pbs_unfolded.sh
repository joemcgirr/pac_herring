#!/bin/bash

#SBATCH --job-name=PWS91_PWS96_PWS07_fst_pbs_unfolded
#SBATCH --mem=8G 
#SBATCH --ntasks=1 
#SBATCH -e PWS91_PWS96_PWS07_fst_pbs_unfolded_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/apps/angsd/misc/realSFS fst index /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_PWS91_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_PWS96_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_PWS07_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx -sfs /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/unfolded_PWS91_PWS96.sfs -sfs /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/unfolded_PWS91_PWS07.sfs -sfs /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/unfolded_PWS96_PWS07.sfs -fstout /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/unfolded_PWS91_PWS96_PWS07_persite 
/home/jamcgirr/apps/angsd/misc/realSFS fst stats2 /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/unfolded_PWS91_PWS96_PWS07_persite.fst.idx -win 50000 -step 10000 > /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/fst_pbs_50kb_win_10kb_step_unfolded_PWS91_PWS96_PWS07.txt 


#command to run: sbatch script_PWS91_PWS96_PWS07_fst_pbs_unfolded.sh