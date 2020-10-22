#!/bin/bash

#SBATCH --job-name=fst_pbs_BC17_WA17_CA17
#SBATCH --mem=16G 
#SBATCH --ntasks=4 
#SBATCH -e fst_pbs_BC17_WA17_CA17_%A_%a.err 
#SBATCH --time=48:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_BC17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_WA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx -P 4 > /home/jamcgirr/ph/data/angsd/SFS/split_pops/BC17_WA17.ml 
/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_BC17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_CA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx -P 4 > /home/jamcgirr/ph/data/angsd/SFS/split_pops/BC17_CA17.ml 
/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_WA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_CA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx -P 4 > /home/jamcgirr/ph/data/angsd/SFS/split_pops/WA17_CA17.ml 

/home/jamcgirr/apps/angsd/misc/realSFS fst index /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_BC17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_WA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_CA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx -sfs /home/jamcgirr/ph/data/angsd/SFS/split_pops/BC17_WA17.ml -sfs /home/jamcgirr/ph/data/angsd/SFS/split_pops/BC17_CA17.ml -sfs /home/jamcgirr/ph/data/angsd/SFS/split_pops/WA17_CA17.ml -fstout /home/jamcgirr/ph/data/angsd/SFS/split_pops/comp_BC17_WA17_CA17  
/home/jamcgirr/apps/angsd/misc/realSFS fst stats2 /home/jamcgirr/ph/data/angsd/SFS/split_pops/comp_BC17_WA17_CA17.fst.idx -win 50000 -step 10000 > /home/jamcgirr/ph/data/angsd/SFS/split_pops/fst_pbs_50kb_win_10kb_step_BC17_WA17_CA17.txt 


#command to run: sbatch script_fst_pbs_BC17_WA17_CA17.sh