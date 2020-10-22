#!/bin/bash

#SBATCH --job-name=bamlist_theta
#SBATCH --mem=16G 
#SBATCH --ntasks=16 
#SBATCH -e bamlist_theta_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

#module load angsd/911

#/home/jamcgirr/apps/angsd.930/angsd/angsd -b PWS91_n10_bam.filelist.txt -doThetas 1 -pest PWS91_n10_bam.sfs -doSaf 1 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -GL 1 -P 16 -out PWS91_n10_bam_dothetas.930 -minMapQ 30 -minQ 20
/home/jamcgirr/apps/angsd.930/angsd/angsd -b PWS91_n10_bam.filelist.txt -doSaf 1 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -GL 1 -P 16 -out PWS91_n10_bam -minMapQ 30 -minQ 20
/home/jamcgirr/apps/angsd.930/angsd/misc/realSFS PWS91_n10_bam.saf.idx -P 16 -fold 1 -sites sites.txt -nSites 2972147 > PWS91_n10_bam.sfs
/home/jamcgirr/apps/angsd.930/angsd/angsd -b PWS91_n10_bam.filelist.txt -doThetas 1 -pest PWS91_n10_bam.sfs -doSaf 1 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -GL 1 -P 16 -out PWS91_n10_bam_dothetas.930 -minMapQ 30 -minQ 20

#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS saf2theta PWS91_n10_bam.saf.idx -outname PWS91_n10_bam -sfs PWS91_n10_bam.sfs

#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat PWS91_n10_bam_dothetas.930.thetas.idx 
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat PWS91_n10_bam_dothetas.930.thetas.idx -win 50000 -step 10000 -outnames theta.dothetas.930thetasWindow.gz
   
#command to run: sbatch script_bamlist_theta.sh