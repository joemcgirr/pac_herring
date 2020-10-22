#!/bin/bash

#SBATCH --job-name=MDS
#SBATCH --mem=8G 
#SBATCH --ntasks=1 
#SBATCH -e MDS_%A_%a.err 
#SBATCH --time=24:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load plink 
#plink --file /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5 --genome --chr chr1 --out /home/jamcgirr/ph/data/plink/chr_1ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5
#plink --file /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5 --cluster --chr chr1 --out /home/jamcgirr/ph/data/plink/chr_1ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5
plink --file /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5 --read-genome /home/jamcgirr/ph/data/plink/chr_1ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.genome --mds-plot 4 --cluster --chr chr1 --out /home/jamcgirr/ph/data/plink/chr_1ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5


#command to run: sbatch script_MDS.sh