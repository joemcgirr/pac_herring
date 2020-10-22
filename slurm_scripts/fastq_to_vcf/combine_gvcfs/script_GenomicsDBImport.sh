#!/bin/bash

#SBATCH --job-name=GenomicsDBImport
#SBATCH --mem=32G
#SBATCH --ntasks=4
#SBATCH --time=06-00:00
#SBATCH -e GenomicsDBImport_%A_%a.err
#SBATCH --mail-user=jmcgirr@email.unc.edu
#SBATCH --mail-type=ALL
#SBATCH -p high

module load R
module load maven
module load java
module load GATK/4.1.4.1

mkdir -p /scratch/jamcgirr/combine_gvcfs/gvcf_tmp

gatk --java-options "-Xmx28g -Xms16g" \
GenomicsDBImport \
--genomicsdb-workspace-path /scratch/jamcgirr/combine_gvcfs/ph_database \
--batch-size 50 \
-L /home/jamcgirr/ph/combine_gvcfs/whole_g_intervals.list \
--sample-name-map /home/jamcgirr/ph/combine_gvcfs/ph.gvcfs_map \
--tmp-dir=/scratch/jamcgirr/combine_gvcfs/gvcf_tmp \
--reader-threads 4

#command to run it on longleaf is sbatch script_GenomicsDBImport.sh