#!/bin/bash

#SBATCH --job-name=PWS91_PWS96_freqs_perms
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e PWS91_PWS96_freqs_perms_%A_%a.err 
#SBATCH --time=144:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

for i in {1..1000} 
do 
cat /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/PWS91_plates_1_through_5_rm.txt /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/PWS96_plates_1_through_5_rm.txt > /home/jamcgirr/ph/data/freqs/perms/PWS91_PWS96/pops_PWS91PWS96.txt 
shuf /home/jamcgirr/ph/data/freqs/perms/PWS91_PWS96/pops_PWS91PWS96.txt > /home/jamcgirr/ph/data/freqs/perms/PWS91_PWS96/shufpops_PWS91PWS96.txt 
head -58 /home/jamcgirr/ph/data/freqs/perms/PWS91_PWS96/shufpops_PWS91PWS96.txt > /home/jamcgirr/ph/data/freqs/perms/PWS91_PWS96/shufpop_PWS91.txt 
tail -72 /home/jamcgirr/ph/data/freqs/perms/PWS91_PWS96/shufpops_PWS91PWS96.txt > /home/jamcgirr/ph/data/freqs/perms/PWS91_PWS96/shufpop_PWS96.txt 

module load bcftools 
bcftools view -S /home/jamcgirr/ph/data/freqs/perms/PWS91_PWS96/shufpop_PWS91.txt /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf.gz --threads 4 | bcftools +fill-tags -- -t AF | bcftools query -f '%CHROM %POS %AF\n' > /home/jamcgirr/ph/data/freqs/perms/PWS91_PWS96/shufpop_PWS91_freqs.txt 
bcftools view -S /home/jamcgirr/ph/data/freqs/perms/PWS91_PWS96/shufpop_PWS96.txt /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf.gz --threads 4 | bcftools +fill-tags -- -t AF | bcftools query -f '%CHROM %POS %AF\n' > /home/jamcgirr/ph/data/freqs/perms/PWS91_PWS96/shufpop_PWS96_freqs.txt 

Rscript /home/jamcgirr/ph/data/freqs/perms//AF_permutations.R --pop0 PWS91 --pop1 PWS96 
rm /home/jamcgirr/ph/data/freqs/perms/PWS91_PWS96/shufpop_PWS91_freqs.txt 
rm /home/jamcgirr/ph/data/freqs/perms/PWS91_PWS96/shufpop_PWS96_freqs.txt 
done 

