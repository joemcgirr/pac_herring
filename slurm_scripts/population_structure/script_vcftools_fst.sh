#!/bin/bash

#SBATCH --job-name=vcftools_fst
#SBATCH --mem=16G 
#SBATCH --ntasks=1 
#SBATCH -e vcftools_fst_%A_%a.err 
#SBATCH --time=48:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load vcftools 
#vcftools --vcf /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.vcf --keep /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/CA17_WA17_plates_1_5_rm.txt --out /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/vcftools_fst_CA17_v_WA17 --weir-fst-pop /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/CA17_plates_1_through_5_rm.txt --weir-fst-pop /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/WA17_plates_1_through_5_rm.txt 
#vcftools --vcf /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.vcf --keep /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS07_PWS91_plates_1_5_rm.txt --out /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/vcftools_fst_PWS07_v_PWS91 --weir-fst-pop /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS07_plates_1_through_5_rm.txt --weir-fst-pop /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_plates_1_through_5_rm.txt 
vcftools --vcf /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.vcf --keep /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_TB96_plates_1_5_rm.txt --out /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/vcftools_fst_TB91_v_TB96 --weir-fst-pop /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB96_plates_1_through_5_rm.txt --weir-fst-pop /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_plates_1_through_5_rm.txt 
vcftools --vcf /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.vcf --keep /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_TB06_plates_1_5_rm.txt --out /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/vcftools_fst_TB91_v_TB06 --weir-fst-pop /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB06_plates_1_through_5_rm.txt --weir-fst-pop /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_plates_1_through_5_rm.txt 


#command to run: sbatch script_vcftools_fst.sh