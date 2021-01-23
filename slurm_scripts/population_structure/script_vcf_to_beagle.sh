#!/bin/bash

#SBATCH --job-name=vcf_to_beagle
#SBATCH --mem=16G 
#SBATCH --ntasks=4 
#SBATCH -e vcf_to_beagle_%A_%a.err 
#SBATCH --time=24:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

#module load vcftools 
#vcftools --gzvcf /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf.gz --BEAGLE-PL --chr chr1 --out /home/jamcgirr/ph/data/vcfs/my_chr1 
#for i in {2..26} 
#do 
#vcftools --gzvcf /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf.gz --BEAGLE-PL --chr chr$i --out /home/jamcgirr/ph/data/vcfs/my_chr$i 
#done 

cat my_chr1.BEAGLE.PL my_chr2.BEAGLE.PL my_chr3.BEAGLE.PL my_chr4.BEAGLE.PL my_chr5.BEAGLE.PL my_chr6.BEAGLE.PL my_chr7.BEAGLE.PL my_chr8.BEAGLE.PL my_chr9.BEAGLE.PL my_chr10.BEAGLE.PL my_chr11.BEAGLE.PL my_chr12.BEAGLE.PL my_chr13.BEAGLE.PL my_chr14.BEAGLE.PL my_chr15.BEAGLE.PL my_chr16.BEAGLE.PL my_chr17.BEAGLE.PL my_chr18.BEAGLE.PL my_chr19.BEAGLE.PL my_chr20.BEAGLE.PL my_chr21.BEAGLE.PL my_chr22.BEAGLE.PL my_chr23.BEAGLE.PL my_chr24.BEAGLE.PL my_chr25.BEAGLE.PL my_chr26.BEAGLE.PL > my_chrs.BEAGLE.PL  
head -1 my_chr1.BEAGLE.PL > my_chr_beagle_header.txt
grep -v "marker" my_chrs.BEAGLE.PL > my_chrs.BEAGLE.PL2 
cat my_chr_beagle_header.txt my_chrs.BEAGLE.PL2 > ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.BEAGLE.PL
wc -l ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.BEAGLE.PL > my_chr_lines.txt

#command to run: sbatch script_vcf_to_beagle.sh