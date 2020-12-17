#!/bin/bash

#SBATCH --job-name=LD_prune
#SBATCH --mem=8G 
#SBATCH --ntasks=8 
#SBATCH -e LD_prune_%A_%a.err 
#SBATCH --time=24:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load plink 
plink --file /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm --indep-pairwise 500 50 0.1 --out /home/jamcgirr/ph/data/angsd/SFS/downsample/ld_prune/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_500_50_0.1 --threads 8 
sed 's/:/	/g' /home/jamcgirr/ph/data/angsd/SFS/downsample/ld_prune/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_500_50_0.1.prune.in > /home/jamcgirr/ph/data/angsd/SFS/downsample/ld_prune/ld_pruned_keep.txt 
/home/jamcgirr/apps/angsd_sep_20/angsd/angsd sites index /home/jamcgirr/ph/data/angsd/SFS/downsample/ld_prune/ld_pruned_keep.txt 


#command to run: sbatch script_LD_prune.sh