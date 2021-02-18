#!/bin/bash

#SBATCH --job-name=LD_prune
#SBATCH --mem=8G 
#SBATCH --ntasks=8 
#SBATCH -e LD_prune_%A_%a.err 
#SBATCH --time=24:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools 
bcftools view -R /home/jamcgirr/ph/data/plink/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_indep_pairwise_500_50_0.1.prune.in.tab /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5.vcf.gz -Oz --threads 8 > /home/jamcgirr/ph/data/moments/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_ld0.1.vcf.gz 
bcftools query -f '%CHROM %POS %DP %NS\n' /home/jamcgirr/ph/data/moments/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_ld0.1.vcf.gz > /home/jamcgirr/ph/data/moments/vcfs/ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_ld0.1.DP.NS.info 


#run: sbatch script_LD_prune.sh