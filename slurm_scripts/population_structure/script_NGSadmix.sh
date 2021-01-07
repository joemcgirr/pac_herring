#!/bin/bash

#SBATCH --job-name=NGSadmix
#SBATCH --mem=8G 
#SBATCH --ntasks=1 
#SBATCH -e NGSadmix_%A_%a.err 
#SBATCH --time=24:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

#git clone https://github.com/Rosemeis/pcangsd.git
#cd pcangsd/
#python setup.py build_ext --inplace

module load angsd 
NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.BEAGLE.PL.gz -K 2 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k2_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5 -P 4 
NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.BEAGLE.PL.gz -K 3 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k3_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5 -P 4 
NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.BEAGLE.PL.gz -K 4 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k4_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5 -P 4 


#command to run: sbatch script_NGSadmix.sh