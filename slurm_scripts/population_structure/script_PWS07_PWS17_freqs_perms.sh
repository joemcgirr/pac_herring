#!/bin/bash

#SBATCH --job-name=PWS07_PWS17_freqs_perms
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e PWS07_PWS17_freqs_perms_%A_%a.err 
#SBATCH --time=144:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

for i in {1..1000} 
do 
cat /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/PWS07_plates_1_through_5_rm.txt /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/PWS17_plates_1_through_5_rm.txt > /home/jamcgirr/ph/data/freqs/perms/PWS07_PWS17/pops_PWS07PWS17.txt 
shuf /home/jamcgirr/ph/data/freqs/perms/PWS07_PWS17/pops_PWS07PWS17.txt > /home/jamcgirr/ph/data/freqs/perms/PWS07_PWS17/shufpops_PWS07PWS17.txt 
head -46 /home/jamcgirr/ph/data/freqs/perms/PWS07_PWS17/shufpops_PWS07PWS17.txt > /home/jamcgirr/ph/data/freqs/perms/PWS07_PWS17/shufpop_PWS07.txt 
tail -56 /home/jamcgirr/ph/data/freqs/perms/PWS07_PWS17/shufpops_PWS07PWS17.txt > /home/jamcgirr/ph/data/freqs/perms/PWS07_PWS17/shufpop_PWS17.txt 

module load bcftools 
bcftools view -S /home/jamcgirr/ph/data/freqs/perms/PWS07_PWS17/shufpop_PWS07.txt /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf.gz --threads 4 | bcftools +fill-tags -- -t AF | bcftools query -f '%CHROM %POS %AF\n' > /home/jamcgirr/ph/data/freqs/perms/PWS07_PWS17/shufpop_PWS07_freqs.txt 
bcftools view -S /home/jamcgirr/ph/data/freqs/perms/PWS07_PWS17/shufpop_PWS17.txt /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf.gz --threads 4 | bcftools +fill-tags -- -t AF | bcftools query -f '%CHROM %POS %AF\n' > /home/jamcgirr/ph/data/freqs/perms/PWS07_PWS17/shufpop_PWS17_freqs.txt 

Rscript /home/jamcgirr/ph/data/freqs/perms//AF_permutations.R --pop0 PWS07 --pop1 PWS17 
rm /home/jamcgirr/ph/data/freqs/perms/PWS07_PWS17/shufpop_PWS07_freqs.txt 
rm /home/jamcgirr/ph/data/freqs/perms/PWS07_PWS17/shufpop_PWS17_freqs.txt 
done 

