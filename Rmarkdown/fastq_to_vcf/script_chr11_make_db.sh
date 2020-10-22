#!/bin/bash

#SBATCH --job-name=chr11_make_db
#SBATCH --mem=16G 
#SBATCH --ntasks=4 
#SBATCH -e chr11_make_db_%A_%a.err 
#SBATCH --time=72:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

# This must be run in directory containing final DB (gendb://) (/home/jamcgirr/ph/data/combine_gvcfs)

scratch_tmp=/scratch/jamcgirr/combine_gvcfs_chr11_tmp 
scratch_cp_to_home=/scratch/jamcgirr/combine_gvcfs_chr11 
home_cp=/home/jamcgirr/ph/data/combine_gvcfs/chr11 

module load R 
module load maven 
module load java 
module load GATK/4.1.4.1 

mkdir -vp $scratch_tmp 

gatk --java-options "-Xmx12g -Xms8g" GenomicsDBImport --genomicsdb-workspace-path $scratch_cp_to_home --batch-size 100 -L chr11_interval.list --sample-name-map /home/jamcgirr/ph/scripts/fastq_to_vcf/combine_gvcfs/ph.gvcfs_map --tmp-dir=$scratch_tmp --reader-threads 4 

cp -r $scratch_cp_to_home/* $home_cp 
##rm SCRATCH ONLY!! 
rm -r $scratch_tmp 
rm -r $scratch_cp_to_home 

sbatch script_chr11_1_genotypegvcf.sh 
sbatch script_chr11_2_genotypegvcf.sh 


#command to run: sbatch script_chr11_make_db.sh