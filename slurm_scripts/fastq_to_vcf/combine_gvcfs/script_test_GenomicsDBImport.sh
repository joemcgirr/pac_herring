#!/bin/bash

#SBATCH --job-name=test_GenomicsDBImport
#SBATCH --mem=16G
#SBATCH --ntasks=4
#SBATCH --time=8:00:00
#SBATCH -e test_GenomicsDBImport_%A_%a.err
#SBATCH --mail-user=jamcgirr@ucdavis.edu
#SBATCH --mail-type=ALL
#SBATCH -p high

module load R
module load maven
module load java
module load GATK/4.1.4.1

###mkdir -vp /scratch/jamcgirr/combine_gvcfs
mkdir -vp /scratch/jamcgirr/combine_gvcfs_tmp

gatk --java-options "-Xmx12g -Xms8g" \
GenomicsDBImport \
--genomicsdb-workspace-path /scratch/jamcgirr/combine_gvcfs \
--batch-size 10 \
-L chr1 \
--sample-name-map /home/jamcgirr/ph/scripts/fastq_to_vcf/combine_gvcfs/combine_test/combine_10.gvcfs_map \
--tmp-dir=/scratch/jamcgirr/combine_gvcfs_tmp \
--reader-threads 4

cp -r /scratch/jamcgirr/combine_gvcfs/* /home/jamcgirr/ph/data/combine_test
ls -lth /scratch/jamcgirr/combine_gvcfs_tmp > /home/jamcgirr/ph/scripts/fastq_to_vcf/combine_gvcfs/combine_test/tmp_dir_contents.txt

# rm SCRATCH ONLY!!
rm -r /scratch/jamcgirr/combine_gvcfs
rm -r /scratch/jamcgirr/combine_gvcfs_tmp

#command to run it on longleaf is sbatch script_test_GenomicsDBImport.sh