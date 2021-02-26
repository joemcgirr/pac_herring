#!/bin/bash

#SBATCH --job-name=TB06_TB17_freqs_perms
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e TB06_TB17_freqs_perms_%A_%a.err 
#SBATCH --time=144:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

for i in {1..1000} 
do 
cat /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/TB06_plates_1_through_5_rm.txt /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/TB17_plates_1_through_5_rm.txt > /home/jamcgirr/ph/data/freqs/perms/TB06_TB17/pops_TB06TB17.txt 
shuf /home/jamcgirr/ph/data/freqs/perms/TB06_TB17/pops_TB06TB17.txt > /home/jamcgirr/ph/data/freqs/perms/TB06_TB17/shufpops_TB06TB17.txt 
head -52 /home/jamcgirr/ph/data/freqs/perms/TB06_TB17/shufpops_TB06TB17.txt > /home/jamcgirr/ph/data/freqs/perms/TB06_TB17/shufpop_TB06.txt 
tail -72 /home/jamcgirr/ph/data/freqs/perms/TB06_TB17/shufpops_TB06TB17.txt > /home/jamcgirr/ph/data/freqs/perms/TB06_TB17/shufpop_TB17.txt 

module load bcftools 
bcftools view -S /home/jamcgirr/ph/data/freqs/perms/TB06_TB17/shufpop_TB06.txt /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf.gz --threads 4 | bcftools +fill-tags -- -t AF | bcftools query -f '%CHROM %POS %AF\n' > /home/jamcgirr/ph/data/freqs/perms/TB06_TB17/shufpop_TB06_freqs.txt 
bcftools view -S /home/jamcgirr/ph/data/freqs/perms/TB06_TB17/shufpop_TB17.txt /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf.gz --threads 4 | bcftools +fill-tags -- -t AF | bcftools query -f '%CHROM %POS %AF\n' > /home/jamcgirr/ph/data/freqs/perms/TB06_TB17/shufpop_TB17_freqs.txt 

Rscript /home/jamcgirr/ph/data/freqs/perms//AF_permutations.R --pop0 TB06 --pop1 TB17 
rm /home/jamcgirr/ph/data/freqs/perms/TB06_TB17/shufpop_TB06_freqs.txt 
rm /home/jamcgirr/ph/data/freqs/perms/TB06_TB17/shufpop_TB17_freqs.txt 
done 

