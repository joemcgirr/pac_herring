#!/bin/bash

#SBATCH --job-name=LD
#SBATCH --mem=8G 
#SBATCH --ntasks=8 
#SBATCH -e LD_%A_%a.err 
#SBATCH --time=24:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load plink 
plink --file /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm --indep-pairwise 100 10 0.8 --r2 --out /home/jamcgirr/ph/data/plink/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm --threads 8 


#command to run: sbatch script_LD.sh