#!/bin/bash

#SBATCH --job-name=popvae
#SBATCH --mem=32G 
#SBATCH --ntasks=4 
#SBATCH -e popvae_%A_%a.err 
#SBATCH --time=144:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

source /home/jamcgirr/apps/my_python3.7/bin/activate 
popvae.py --infile /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf.gz --out /home/jamcgirr/ph/data/popvae/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05 --seed 42 


#run: sbatch script_popvae.sh