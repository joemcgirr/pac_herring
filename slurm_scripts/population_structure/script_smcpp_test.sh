#!/bin/bash

#SBATCH --job-name=smcpp_test
#SBATCH --mem=16G 
#SBATCH --ntasks=4 
#SBATCH -e smcpp_test_%A_%a.err 
#SBATCH --time=24:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

#module load tabix 
#module load samtools

#cp /home/jamcgirr/ph/data/vcfs/split_pops/population_CA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm.vcf /home/jamcgirr/ph/data/vcfs/split_pops/test_smcpp/
#bgzip /home/jamcgirr/ph/data/vcfs/split_pops/test_smcpp/population_CA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm.vcf
#tabix -p vcf /home/jamcgirr/ph/data/vcfs/split_pops/test_smcpp/population_CA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm.vcf.gz

#module load vcftools
#vcftools --gzvcf /home/jamcgirr/ph/data/vcfs/split_pops/test_smcpp/population_CA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm.vcf.gz --recode --recode-INFO GT --recode-INFO AD --recode-INFO DP --recode-INFO GQ --recode-INFO PL --out /home/jamcgirr/ph/data/vcfs/split_pops/test_smcpp/CA17smcpp
#bgzip /home/jamcgirr/ph/data/vcfs/split_pops/test_smcpp/CA17smcpp.recode.vcf
#tabix -p vcf /home/jamcgirr/ph/data/vcfs/split_pops/test_smcpp/CA17smcpp.recode.vcf.gz

source /home/jamcgirr/apps/my_python3.7/bin/activate 
module load mpfr 
module load gmp 
module load gsl 
#bgzip /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf 
#tabix -p vcf /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf.gz 
#smc++ vcf2smc /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf.gz /home/jamcgirr/ph/data/smcpp/pop1.smc.gz chr1 pop1:0393_SS96,0394_SS96
#smc++ vcf2smc /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf.gz /home/jamcgirr/ph/data/smcpp/pop2.smc.gz chr1 pop2:0545_CA17,0546_CA17
#smc++ estimate -o /home/jamcgirr/ph/data/smcpp/pop1/ 2.0e-9 /home/jamcgirr/ph/data/smcpp/pop1.smc.gz 
#smc++ estimate -o /home/jamcgirr/ph/data/smcpp/pop2/ 2.0e-9 /home/jamcgirr/ph/data/smcpp/pop2.smc.gz 
#smc++ vcf2smc /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf.gz /home/jamcgirr/ph/data/smcpp/pop12.smc.gz chr1 pop1:0385_TB17,0386_TB17 pop2:0329_PWS17,0330_PWS17 
#smc++ vcf2smc /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf.gz /home/jamcgirr/ph/data/smcpp/pop21.smc.gz chr1 pop2:0329_PWS17,0330_PWS17 pop1:0385_TB17,0386_TB17 
#smc++ split -o /home/jamcgirr/ph/data/smcpp/ /home/jamcgirr/ph/data/smcpp/pop1/model.final.json /home/jamcgirr/ph/data/smcpp/pop2/model.final.json /home/jamcgirr/ph/data/smcpp/*.smc.gz 
#smc++ plot joint.pdf /home/jamcgirr/ph/data/smcpp/model.final.json 


#smc++ vcf2smc /home/jamcgirr/ph/data/vcfs/split_pops/test_smcpp/population_CA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm.vcf.gz /home/jamcgirr/ph/data/smcpp/popCA17.smc.gz chr1 pop2:0545_CA17,0546_CA17
smc++ vcf2smc /home/jamcgirr/ph/data/vcfs/split_pops/test_smcpp/CA17smcpp.recode.vcf.gz /home/jamcgirr/ph/data/smcpp/popCA17_recoded.smc.gz chr1 pop2:0545_CA17,0546_CA17

#command to run: sbatch script_smcpp_test.sh