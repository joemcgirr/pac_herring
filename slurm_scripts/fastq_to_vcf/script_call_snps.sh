#!/bin/bash

#SBATCH --job-name=call_snps
#SBATCH --mem=16G 
#SBATCH --ntasks=4 
#SBATCH -e call_snps_%A_%a.err 
#SBATCH --time=06-00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

#module load samtools 
#samtools index /home/jamcgirr/ph/data/hi_cov/PH_Sitka_93.sort.dedup.bam
#module load R 
#module load maven 
#module load java 
#module load GATK/4.1.4.1 

#gatk HaplotypeCaller --java-options "-Xmx14g -XX:ParallelGCThreads=4" -R /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -I /home/jamcgirr/ph/data/hi_cov/PH_Sitka_93.sort.dedup.bam -O /home/jamcgirr/ph/data/hi_cov/PH_Sitka_93.raw.g.vcf --emit-ref-confidence GVCF 
#gatk SelectVariants --java-options "-Xmx14g -XX:ParallelGCThreads=4" -R /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -V /home/jamcgirr/ph/data/hi_cov/PH_Sitka_93.raw.g.vcf --select-type-to-include SNP -O /home/jamcgirr/ph/data/hi_cov/PH_Sitka_93.raw_snps.vcf 

#module load vcftools 
#vcftools --vcf /home/jamcgirr/ph/data/hi_cov/PH_Sitka_93.raw.g.vcf --remove-indels --recode --recode-INFO-all --out /home/jamcgirr/ph/data/hi_cov/raw_snps_PH_Sitka_93 
#vcftools --vcf /home/jamcgirr/ph/data/hi_cov/raw_snps_PH_Sitka_93.recode.vcf --get-INFO MQ --get-INFO QUAL --get-INFO SOR --get-INFO DP --get-INFO FS --get-INFO QD --get-INFO MQRankSum --get-INFO ReadPosRankSum 

module load samtools 
module load bcftools 
samtools mpileup -uf /home/jamcgirr/ph/data/c_harengus/c.harengus.fa /home/jamcgirr/ph/data/hi_cov/PH_Sitka_93.sort.dedup.bam | bcftools call --threads 4 -m -Ov -o /home/jamcgirr/ph/data/hi_cov/raw_variants_PH_Sitka_93.vcf 


#command to run: sbatch script_call_snps.sh