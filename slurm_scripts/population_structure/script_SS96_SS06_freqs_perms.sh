#!/bin/bash

#SBATCH --job-name=SS96_SS06_freqs_perms
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e SS96_SS06_freqs_perms_%A_%a.err 
#SBATCH --time=144:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

for i in {1..1000} 
do 
cat /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/SS96_plates_1_through_5_rm.txt /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/SS06_plates_1_through_5_rm.txt > /home/jamcgirr/ph/data/freqs/perms/SS96_SS06/pops_SS96SS06.txt 
shuf /home/jamcgirr/ph/data/freqs/perms/SS96_SS06/pops_SS96SS06.txt > /home/jamcgirr/ph/data/freqs/perms/SS96_SS06/shufpops_SS96SS06.txt 
head -78 /home/jamcgirr/ph/data/freqs/perms/SS96_SS06/shufpops_SS96SS06.txt > /home/jamcgirr/ph/data/freqs/perms/SS96_SS06/shufpop_SS96.txt 
tail -41 /home/jamcgirr/ph/data/freqs/perms/SS96_SS06/shufpops_SS96SS06.txt > /home/jamcgirr/ph/data/freqs/perms/SS96_SS06/shufpop_SS06.txt 

module load bcftools 
bcftools view -S /home/jamcgirr/ph/data/freqs/perms/SS96_SS06/shufpop_SS96.txt /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf.gz --threads 4 | bcftools +fill-tags -- -t AF | bcftools query -f '%CHROM %POS %AF\n' > /home/jamcgirr/ph/data/freqs/perms/SS96_SS06/shufpop_SS96_freqs.txt 
bcftools view -S /home/jamcgirr/ph/data/freqs/perms/SS96_SS06/shufpop_SS06.txt /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf.gz --threads 4 | bcftools +fill-tags -- -t AF | bcftools query -f '%CHROM %POS %AF\n' > /home/jamcgirr/ph/data/freqs/perms/SS96_SS06/shufpop_SS06_freqs.txt 

Rscript /home/jamcgirr/ph/data/freqs/perms//AF_permutations.R --pop0 SS96 --pop1 SS06 
rm /home/jamcgirr/ph/data/freqs/perms/SS96_SS06/shufpop_SS96_freqs.txt 
rm /home/jamcgirr/ph/data/freqs/perms/SS96_SS06/shufpop_SS06_freqs.txt 
done 

