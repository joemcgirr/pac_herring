#!/bin/bash

#SBATCH --job-name=chr1_GenomicsDBImport
#SBATCH --mem=32G
#SBATCH --ntasks=8
#SBATCH --time=06-00:00
#SBATCH -e chr1_GenomicsDBImport_%A_%a.err
#SBATCH --mail-user=jamcgirr@ucdavis.edu
#SBATCH --mail-type=ALL
#SBATCH -p high

# This must be run in directory containing final DB (gendb://) (/home/jamcgirr/ph/data/combine_gvcfs)

scratch_tmp=/scratch/jamcgirr/combine_gvcfs_chr1_tmp
scratch_cp_to_home=/scratch/jamcgirr/combine_gvcfs_chr1
home_cp=/home/jamcgirr/ph/data/combine_gvcfs/chr1

module load R
module load maven
module load java
module load GATK/4.1.4.1

mkdir -vp $scratch_tmp

gatk --java-options "-Xmx24g -Xms16g" \
GenomicsDBImport \
--genomicsdb-workspace-path $scratch_cp_to_home \
--batch-size 100 \
-L chr1_interval.list \
--sample-name-map /home/jamcgirr/ph/scripts/fastq_to_vcf/combine_gvcfs/ph.gvcfs_map \
--tmp-dir=$scratch_tmp \
--reader-threads 8

cp -r $scratch_cp_to_home/* $home_cp

##rm SCRATCH ONLY!!
rm -r $scratch_tmp
rm -r $scratch_cp_to_home

gatk GenotypeGVCFs \
    -R /home/jamcgirr/ph/data/c_harengus/c.harengus.fa \
    -V gendb://chr1 \
    -O chr1.vcf

#command to run it on longleaf is sbatch script_chr1_GenomicsDBImport.sh
