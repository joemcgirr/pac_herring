#!/bin/bash

#SBATCH --job-name=WA17_subset_pops_vcfs
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e WA17_subset_pops_vcfs_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools 
bcftools view -S /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/WA17_plates_1_through_5_rm.txt --threads 4 /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5.vcf.gz | bcftools +fill-tags -Oz -- -t all,'DP=sum(DP)' > /home/jamcgirr/ph/data/vcfs/split_pops/maf00/population_WA17_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5.vcf.gz 


#command to run: sbatch script_WA17_subset_pops_vcfs.sh