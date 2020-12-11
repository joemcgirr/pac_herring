#!/bin/bash

#SBATCH --job-name=pixy_BC17
#SBATCH --mem=16G 
#SBATCH --ntasks=4
#SBATCH -e pixy_BC17_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

# installation
# conda create -n mypixyenv python=3.7
# conda install -n mypixyenv -c conda-forge pixy 
# 
export PATH=/home/jamcgirr/apps/anaconda3/bin:$PATH
source activate mypixyenv

pixy --stats pi --vcf /home/jamcgirr/ph/data/mpileup/allsites_calls_BC17.vcf.gz --variant_filter_expression 'DP>=30' --invariant_filter_expression 'DP>=30' --zarr_path /home/jamcgirr/ph/data/combine_gvcfs/mpileup/angsd_test/zarr --window_size 50000 --populations /home/jamcgirr/ph/data/combine_gvcfs/mpileup/angsd_test/popBC_dots.txt --outfile_prefix /home/jamcgirr/ph/data/combine_gvcfs/mpileup/angsd_test/output_pixy/pixy_out






#bcftools mpileup -f /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -b /home/jamcgirr/ph/data/angsd/SFS/bamlist_test/all_bams_p_1_5_rm.txt -I -r chr1:1-16542129 --threads 8 -o allsites_test_chr1.vcf

#bcftools reheader -s samples_delete.txt allsites_test_chr1.vcf > allsites_test_reheader_chr1.vcf

#gzip -d /home/jamcgirr/ph/data/combine_gvcfs/mpileup/allsites_chr1_1.vcf.gz > /home/jamcgirr/ph/data/combine_gvcfs/mpileup/angsd_test/allsites_chr1_1.vcf
#module load angsd
#/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -vcf-pl /home/jamcgirr/ph/data/combine_gvcfs/mpileup/allsites_chr1_1.vcf -doSaf 1 -doMajorMinor 1 -out test_sfs -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -fai /home/jamcgirr/ph/data/c_harengus/c.harengus.fa.fai -nInd 892
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS test_sfs.saf.idx -fold 1 > test_sfs.sfs 
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS saf2theta test_sfs.saf.idx -outname test_sfs -fold 1 -sfs test_sfs.sfs 
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat test_sfs.thetas.idx 
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat test_sfs.thetas.idx -win 50000 -step 10000 -outnames test_50kb_win_10kb_step 


#samtools mpileup -f /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -b /home/jamcgirr/ph/data/angsd/SFS/bamlist_test/all_bams_p_1_5_rm.txt -r chr1:1-100000 -o allsites_samtest.pileup
#/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -pileup allsites_samtest.pileup -doSaf 1 -out pileup_sfs -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -fai /home/jamcgirr/ph/data/c_harengus/c.harengus.fa.fai -nInd 892


#module load vcftools
#vcftools --vcf /home/jamcgirr/ph/data/combine_gvcfs/mpileup/allsites_chr1_1.vcf --BEAGLE-PL --chr chr1 --out allsites_chr1_1_beagle


#run: sbatch script_pixy_BC17.sh
