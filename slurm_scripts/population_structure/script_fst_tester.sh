#!/bin/bash

#SBATCH --job-name=fst_tester
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e fst_tester_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/apps/angsd/misc/realSFS fst index /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_CA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_WA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx -whichFst 1 -fstout /home/jamcgirr/ph/data/angsd/SFS/split_pops/tester -sfs /home/jamcgirr/ph/data/angsd/SFS/split_pops/WA17_CA17.ml



#command to run: sbatch script_fst_tester.sh