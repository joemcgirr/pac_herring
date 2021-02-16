#!/bin/bash

#SBATCH --job-name=LD
#SBATCH --mem=30G 
#SBATCH --ntasks=8 
#SBATCH -e LD_%A_%a.err 
#SBATCH --time=24:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load plink 
plink --file /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5 --indep-pairwise 500 50 0.1 --r2 --out /home/jamcgirr/ph/data/plink/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_indep_pairwise_500_50_0.1 --threads 8 
#sed 's/:/	/g' /home/jamcgirr/ph/data/plink/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_indep_pairwise_500_50_0.1.prune.in > /home/jamcgirr/ph/data/plink/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_indep_pairwise_500_50_0.1.prune.in.tab 


#command to run: sbatch script_LD.sh