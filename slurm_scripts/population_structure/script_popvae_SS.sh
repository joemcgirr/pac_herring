#!/bin/bash

#SBATCH --job-name=popvae_SS
#SBATCH --mem=32G 
#SBATCH --ntasks=4 
#SBATCH -e popvae_SS_%A_%a.err 
#SBATCH --time=24:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load samtools 
module load bcftools 
cat /home/jamcgirr/ph/data/angsd/SFS/thetas/SS96_bams_p_1_5_rm.txt /home/jamcgirr/ph/data/angsd/SFS/thetas/SS06_bams_p_1_5_rm.txt /home/jamcgirr/ph/data/angsd/SFS/thetas/SS17_bams_p_1_5_rm.txt > /home/jamcgirr/ph/data/popvae/pops_SS.txt 
sed -i 's/\/home\/eoziolor\/phpopg\/data\/align\///g' /home/jamcgirr/ph/data/popvae/pops_SS.txt 
sed -i 's/.bam//g' /home/jamcgirr/ph/data/popvae/pops_SS.txt 
bcftools view -S /home/jamcgirr/ph/data/popvae/pops_SS.txt -Oz /home/jamcgirr/ph/data/vcfs/vince/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf.gz -R /home/jamcgirr/ph/data/moments/ld_prune/random_thin_keep.txt --threads 4 > /home/jamcgirr/ph/data/popvae/SS_random_thin.vcf.gz 
source /home/jamcgirr/apps/my_python3.7/bin/activate 
popvae.py --infile /home/jamcgirr/ph/data/popvae/SS_random_thin.vcf.gz --out /home/jamcgirr/ph/data/popvae/SS_random_thin --seed 42 


#run: sbatch script_popvae_SS.sh