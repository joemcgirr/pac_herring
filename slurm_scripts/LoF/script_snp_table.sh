#!/bin/bash

#SBATCH --job-name=snp_table
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e snp_table_%A_%a.err 
#SBATCH --time=24:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load R 
module load maven 
module load java 
module load GATK/4.1.4.1 

gatk IndexFeatureFile -F /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf.gz  
gatk VariantsToTable -V /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf.gz -F CHROM -F POS -F REF -F ALT -O /home/jamcgirr/ph/data/LoF/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05_table.txt 

sed 's/chr//g' /home/jamcgirr/ph/data/LoF/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05_table.txt > /home/jamcgirr/ph/data/LoF/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05_table_VEP.txt  
sed -i 's/	/:/g' /home/jamcgirr/ph/data/LoF/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05_table_VEP.txt 
sed -i '1d' /home/jamcgirr/ph/data/LoF/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05_table_VEP.txt 


#run: sbatch script_snp_table.sh