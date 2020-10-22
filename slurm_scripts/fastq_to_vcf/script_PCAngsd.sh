#!/bin/bash

#SBATCH --job-name=PCAngsd
#SBATCH --mem=8G 
#SBATCH --ntasks=1 
#SBATCH -e PCAngsd_%A_%a.err 
#SBATCH --time=24:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load pcangsd 
#gzip /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP350_maxDP2000_maf0.05_minQ30_maxmiss0.5.BEAGLE.PL > /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP350_maxDP2000_maf0.05_minQ30_maxmiss0.5.BEAGLE.PL.gz 
python /home/jamcgirr/apps/pcangsd/pcangsd.py -beagle /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP350_maxDP2000_maf0.05_minQ30_maxmiss0.5.BEAGLE.PL.gz -o test1 -threads 1 


#command to run: sbatch script_PCAngsd.sh