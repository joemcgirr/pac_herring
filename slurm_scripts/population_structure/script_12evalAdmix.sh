#!/bin/bash

#SBATCH --job-name=12evalAdmix
#SBATCH --mem=16G 
#SBATCH --ntasks=4 
#SBATCH -e 12evalAdmix_%A_%a.err 
#SBATCH --time=48:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load angsd 
/home/jamcgirr/apps/evalAdmix/evalAdmix -beagle /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.BEAGLE.PL.gz -fname /home/jamcgirr/ph/data/angsd/NGSadmix/k12_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.fopt.gz -qname /home/jamcgirr/ph/data/angsd/NGSadmix/k12_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.qopt -o /home/jamcgirr/ph/data/angsd/NGSadmix/evalAdmix/eval_k12_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5 -P 4 
