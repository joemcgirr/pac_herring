#!/bin/bash

#SBATCH --job-name=TB91_TB96_freqs_perms
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e TB91_TB96_freqs_perms_%A_%a.err 
#SBATCH --time=144:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

for i in {1..1000} 
do 
cat /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/TB91_plates_1_through_5_rm.txt /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/TB96_plates_1_through_5_rm.txt > /home/jamcgirr/ph/data/freqs/perms/TB91_TB96/pops_TB91TB96.txt 
shuf /home/jamcgirr/ph/data/freqs/perms/TB91_TB96/pops_TB91TB96.txt > /home/jamcgirr/ph/data/freqs/perms/TB91_TB96/shufpops_TB91TB96.txt 
head -74 /home/jamcgirr/ph/data/freqs/perms/TB91_TB96/shufpops_TB91TB96.txt > /home/jamcgirr/ph/data/freqs/perms/TB91_TB96/shufpop_TB91.txt 
tail -73 /home/jamcgirr/ph/data/freqs/perms/TB91_TB96/shufpops_TB91TB96.txt > /home/jamcgirr/ph/data/freqs/perms/TB91_TB96/shufpop_TB96.txt 

module load bcftools 
bcftools view -S /home/jamcgirr/ph/data/freqs/perms/TB91_TB96/shufpop_TB91.txt /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf.gz --threads 4 | bcftools +fill-tags -- -t AF | bcftools query -f '%CHROM %POS %AF\n' > /home/jamcgirr/ph/data/freqs/perms/TB91_TB96/shufpop_TB91_freqs.txt 
bcftools view -S /home/jamcgirr/ph/data/freqs/perms/TB91_TB96/shufpop_TB96.txt /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf.gz --threads 4 | bcftools +fill-tags -- -t AF | bcftools query -f '%CHROM %POS %AF\n' > /home/jamcgirr/ph/data/freqs/perms/TB91_TB96/shufpop_TB96_freqs.txt 

Rscript /home/jamcgirr/ph/data/freqs/perms//AF_permutations.R --pop0 TB91 --pop1 TB96 
rm /home/jamcgirr/ph/data/freqs/perms/TB91_TB96/shufpop_TB91_freqs.txt 
rm /home/jamcgirr/ph/data/freqs/perms/TB91_TB96/shufpop_TB96_freqs.txt 
done 

