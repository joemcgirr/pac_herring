#!/bin/bash

#SBATCH --job-name=SS17_SFS
#SBATCH --mem=16G 
#SBATCH --ntasks=8 
#SBATCH -e SS17_SFS_%A_%a.err 
#SBATCH --time=48:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -doSaf 1 -vcf-pl /home/jamcgirr/ph/data/vcfs/split_pops/population_SS17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm.vcf -doMajorMinor 1 -out /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_SS17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_SS17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx -P 8 > /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_SS17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.sfs 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS saf2theta /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_SS17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx -sfs /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_SS17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.sfs -outname /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_SS17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_SS17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.thetas.idx 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_SS17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.thetas.idx -win 50000 -step 10000 -outnames /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_SS17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_theta.thetas50kbWindow.gz 
##/home/jamcgirr/apps/angsd/misc/thetaStat print /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_SS17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.thetas.idx > test.txt 


#command to run: sbatch script_SS17_SFS.sh