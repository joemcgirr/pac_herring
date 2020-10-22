#!/bin/bash

#SBATCH --job-name=mq_filter
#SBATCH --mem=8G 
#SBATCH --ntasks=1 
#SBATCH -e mq_filter_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools 
#/home/jamcgirr/apps/vcflib/bin/vcffilter -f "MQ > 30" /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.vcf > /home/jamcgirr/ph/data/vcfs/tester_mq.vcf 
bcftools filter -Ov -i 'MQ>30' /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.vcf -o /home/jamcgirr/ph/data/vcfs/tester_mq_bcftools.vcf
wc -l /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.vcf > premq_lines.txt 
wc -l /home/jamcgirr/ph/data/vcfs/tester_mq_bcftools.vcf > postmq_lines.txt 


#command to run: sbatch script_mq_filter.sh