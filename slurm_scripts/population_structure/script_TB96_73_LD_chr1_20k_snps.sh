#!/bin/bash

#SBATCH --job-name=TB96_73_LD_chr1_20k_snps
#SBATCH --mem=8G 
#SBATCH --ntasks=1 
#SBATCH -e TB96_73_LD_chr1_20k_snps_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load vcftools 
vcftools --vcf /home/jamcgirr/ph/data/vcfs/chr1_thin20k_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf --keep /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/TB96_plates_1_through_5_rm.txt --BEAGLE-PL --chr chr1 --out /home/jamcgirr/ph/data/vcfs/split_pops/chr1_thin20k_TB96_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm 
gzip /home/jamcgirr/ph/data/vcfs/split_pops/chr1_thin20k_TB96_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.BEAGLE.PL 
/home/jamcgirr/apps/ngsLD/ngsLD --geno /home/jamcgirr/ph/data/vcfs/split_pops/chr1_thin20k_TB96_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.BEAGLE.PL.gz --pos /home/jamcgirr/ph/data/vcfs/split_pops/chr1_thin20k_sites.txt --n_ind 73 --n_sites 20000 --out /home/jamcgirr/ph/data/angsd/ngsLD/chr1_thin20k_TB96_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm_ld.txt 


#command to run: sbatch script_TB96_73_LD_chr1_20k_snps.sh