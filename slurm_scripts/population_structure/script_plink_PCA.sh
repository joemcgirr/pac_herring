#!/bin/bash

#SBATCH --job-name=plink_PCA
#SBATCH --mem=16G 
#SBATCH --ntasks=4 
#SBATCH -e plink_PCA_%A_%a.err 
#SBATCH --time=24:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load plink 
plink --file /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5 --pca --out /home/jamcgirr/ph/data/plink/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5


#command to run: sbatch script_plink_PCA.sh