#!/bin/bash

#SBATCH --job-name=mpileup_test_allsites_chr1
#SBATCH --mem=16G 
#SBATCH --ntasks=8
#SBATCH -e mpileup_test_allsites_chr1_%A_%a.err 
#SBATCH --time=144:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load bcftools
module load samtools
#bcftools mpileup -f /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -b /home/jamcgirr/ph/data/angsd/SFS/bamlist_test/all_bams_p_1_5_rm.txt -I -r chr1:1-100000 --threads 24 | bcftools call -m -Ov -f GQ,GP --threads 24 -o delete2_all_sites_chr1.vcf
bcftools mpileup -f /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -b /home/jamcgirr/ph/data/angsd/SFS/bamlist_test/all_bams_p_1_5_rm.txt -I -r chr1:1-16542129 --threads 8 -o allsites_test_chr1.vcf

bcftools reheader -s samples.delete.txt allsites_test_chr1.vcf > allsites_test_reheader_chr1.vcf
module load angsd
angsd -doSaf 1 -vcf-pl /home/jamcgirr/ph/data/combine_gvcfs/mpileup/allsites_test_reheader_chr1.vcf -out test_sfs -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/combine_gvcfs/mpileup/test_sfs.saf.idx -fold 1 > test_sfs.sfs 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS saf2theta /home/jamcgirr/ph/data/combine_gvcfs/mpileup/test_sfs.saf.idx -outname test_sfs -fold 1 -sfs test_sfs.sfs 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat test_sfs.thetas.idx 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat test_sfs.thetas.idx -win 50000 -step 10000 -outnames test_50kb_win_10kb_step 


#run: sbatch script_mpileup_test_allsites_chr1.sh