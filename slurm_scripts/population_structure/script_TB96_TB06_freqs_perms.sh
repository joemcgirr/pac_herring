#!/bin/bash

#SBATCH --job-name=TB96_TB06_freqs_perms
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e TB96_TB06_freqs_perms_%A_%a.err 
#SBATCH --time=144:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

for i in {1..1000} 
do 
cat /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/TB96_plates_1_through_5_rm.txt /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/TB06_plates_1_through_5_rm.txt > /home/jamcgirr/ph/data/freqs/perms/TB96_TB06/pops_TB96TB06.txt 
shuf /home/jamcgirr/ph/data/freqs/perms/TB96_TB06/pops_TB96TB06.txt > /home/jamcgirr/ph/data/freqs/perms/TB96_TB06/shufpops_TB96TB06.txt 
head -73 /home/jamcgirr/ph/data/freqs/perms/TB96_TB06/shufpops_TB96TB06.txt > /home/jamcgirr/ph/data/freqs/perms/TB96_TB06/shufpop_TB96.txt 
tail -52 /home/jamcgirr/ph/data/freqs/perms/TB96_TB06/shufpops_TB96TB06.txt > /home/jamcgirr/ph/data/freqs/perms/TB96_TB06/shufpop_TB06.txt 

module load bcftools 
bcftools view -S /home/jamcgirr/ph/data/freqs/perms/TB96_TB06/shufpop_TB96.txt /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf.gz --threads 4 | bcftools +fill-tags -- -t AF | bcftools query -f '%CHROM %POS %AF\n' > /home/jamcgirr/ph/data/freqs/perms/TB96_TB06/shufpop_TB96_freqs.txt 
bcftools view -S /home/jamcgirr/ph/data/freqs/perms/TB96_TB06/shufpop_TB06.txt /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf.gz --threads 4 | bcftools +fill-tags -- -t AF | bcftools query -f '%CHROM %POS %AF\n' > /home/jamcgirr/ph/data/freqs/perms/TB96_TB06/shufpop_TB06_freqs.txt 

Rscript /home/jamcgirr/ph/data/freqs/perms//AF_permutations.R --pop0 TB96 --pop1 TB06 
rm /home/jamcgirr/ph/data/freqs/perms/TB96_TB06/shufpop_TB96_freqs.txt 
rm /home/jamcgirr/ph/data/freqs/perms/TB96_TB06/shufpop_TB06_freqs.txt 
done 

