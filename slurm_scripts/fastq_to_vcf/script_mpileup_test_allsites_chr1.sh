#!/bin/bash

#SBATCH --job-name=mpileup_test_allsites_chr1
#SBATCH --mem=16G 
#SBATCH --ntasks=8
#SBATCH -e mpileup_test_allsites_chr1_%A_%a.err 
#SBATCH --time=144:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

#module load bcftools
#module load samtools
#bcftools mpileup -f /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -b /home/jamcgirr/ph/data/angsd/SFS/bamlist_test/all_bams_p_1_5_rm.txt -I -r chr1:1-1000000 --threads 24 | bcftools call -m -Ov -f GQ,GP --threads 24 -o delete2_all_sites_chr1.vcf
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


module load vcftools
vcftools --vcf /home/jamcgirr/ph/data/combine_gvcfs/mpileup/allsites_chr1_1.vcf --BEAGLE-PL --chr chr1 --out allsites_chr1_1_beagle


#run: sbatch script_mpileup_test_allsites_chr1.sh