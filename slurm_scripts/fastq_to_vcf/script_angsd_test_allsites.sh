#!/bin/bash

#SBATCH --job-name=angsd_test_allsites
#SBATCH --mem=24G 
#SBATCH --ntasks=8
#SBATCH -e angsd_test_allsites_%A_%a.err 
#SBATCH --time=48:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

#module load angsd
#module load htslib
#module load samtools
#module load bcftools
/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -vcf-pl /home/jamcgirr/ph/data/mpileup/allsites_BC17.vcf.gz -doSaf 1 -P 8 -out /home/jamcgirr/ph/data/angsd/mpileup/test_sfs -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa 
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/mpileup/test_sfs.saf.idx -fold 1 -P 8 > /home/jamcgirr/ph/data/angsd/mpileup/test_sfs.sfs 
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS saf2theta /home/jamcgirr/ph/data/angsd/mpileup/test_sfs.saf.idx -outname /home/jamcgirr/ph/data/angsd/mpileup/test_sfs -fold 1 -sfs /home/jamcgirr/ph/data/angsd/mpileup/test_sfs.sfs 
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat /home/jamcgirr/ph/data/angsd/mpileup/test_sfs.thetas.idx 
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat /home/jamcgirr/ph/data/angsd/mpileup/test_sfs.thetas.idx -win 50000 -step 10000 -outnames /home/jamcgirr/ph/data/angsd/mpileup/test_50kb_win_10kb_step 

# module load angsd
# angsd -vcf-pl /home/jamcgirr/ph/data/combine_gvcfs/mpileup/allsites_chr1_1.bcf -nLines 10000 -doSaf 1 -doMajorMinor 1 -out test_sfs -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa 
# /home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS test_sfs.saf.idx -fold 1 > test_sfs.sfs 
# /home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS saf2theta test_sfs.saf.idx -outname test_sfs -fold 1 -sfs test_sfs.sfs 
# /home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat test_sfs.thetas.idx 
# /home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat test_sfs.thetas.idx -win 50000 -step 10000 -outnames test_50kb_win_10kb_step 

#angsd -vcf-pl /home/jamcgirr/ph/data/mpileup/allsites_BC17.bcf -doSaf 1 -out /home/jamcgirr/ph/data/angsd/mpileup/test_sfs -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -fai /home/jamcgirr/ph/data/c_harengus/c.harengus.fa.fai -nInd 64

# /home/jamcgirr/apps/angsd_sep_20/angsd/angsd -beagle /home/jamcgirr/ph/data/combine_gvcfs/mpileup/angsd_test/allsites_chr1_1_beagle.BEAGLE.PL -out test

#module load vcftools
#vcftools --vcf /home/jamcgirr/ph/data/combine_gvcfs/mpileup/allsites_chr1_1.vcf --BEAGLE-PL --chr chr1 --out allsites_chr1_1_beagle


#run: sbatch script_angsd_test_allsites.sh
