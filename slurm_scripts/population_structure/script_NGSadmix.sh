#!/bin/bash

#SBATCH --job-name=NGSadmix
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e NGSadmix_%A_%a.err 
#SBATCH --time=144:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

#git clone https://github.com/Rosemeis/pcangsd.git
#cd pcangsd/
#python setup.py build_ext --inplace

module load angsd 
gzip /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.BEAGLE.PL 

for i in {1..20} 
do 
NGSadmix -likes /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.BEAGLE.PL.gz -K $i -o /home/jamcgirr/ph/data/angsd/NGSadmix/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05_k$i -P 4 
done 


#command to run: sbatch script_NGSadmix.sh