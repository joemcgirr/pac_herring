#!/bin/bash

#SBATCH --job-name=beagle_theta
#SBATCH --mem=8G 
#SBATCH --ntasks=8 
#SBATCH -e beagle_theta_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

#module load samtools
#samtools view -H /home/eoziolor/phpopg/data/align/0281_PWS17.bam  | grep SN |cut -f2,3 | sed 's/SN\://g' |  sed 's/LN\://g' > /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/test_ref.fai

/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -doSaf 1 -beagle /home/jamcgirr/ph/data/vcfs/split_pops/chr1_BC17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.BEAGLE.PL.gz -out /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/beagle_chr1_BC17 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -fai /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/test_ref.fai
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/beagle_chr1_BC17.saf.idx -P 8 -fold 1 > /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/beagle_chr1_BC17.sfs
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS saf2theta /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/beagle_chr1_BC17.saf.idx -sfs /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/beagle_chr1_BC17.sfs -fold 1 -outname /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/beagle_chr1_BC17
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/beagle_chr1_BC17.thetas.idx 
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/beagle_chr1_BC17.thetas.idx -win 50000 -step 10000 -outnames /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/beagle_chr1_BC17_theta.thetas50kbWindow.gz
   
#command to run: sbatch script_beagle_theta.sh