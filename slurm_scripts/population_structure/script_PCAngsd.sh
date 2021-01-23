#!/bin/bash

#SBATCH --job-name=PCAngsd
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e PCAngsd_%A_%a.err 
#SBATCH --time=24:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load pcangsd 
#gzip /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.BEAGLE.PL 
python /home/jamcgirr/apps/pcangsd/pcangsd.py -beagle /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.BEAGLE.PL.gz -o /home/jamcgirr/ph/data/angsd/PCAngsd/chr1_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05 -threads 4 
#gzip /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.01.BEAGLE.PL 
python /home/jamcgirr/apps/pcangsd/pcangsd.py -beagle /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.01.BEAGLE.PL.gz -o /home/jamcgirr/ph/data/angsd/PCAngsd/chr1_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.01 -threads 4 


#command to run: sbatch script_PCAngsd.sh