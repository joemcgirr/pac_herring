#!/bin/bash

#SBATCH --job-name=fst_folded_test
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e fst_folded_test_%A_%a.err 
#SBATCH --time=48:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

#/home/jamcgirr/apps/angsd/angsd -doSaf 1 -vcf-pl /home/jamcgirr/ph/data/vcfs/split_pops/population_TB91_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm.vcf -out /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_TB91_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa 
#/home/jamcgirr/apps/angsd/angsd -doSaf 1 -vcf-pl /home/jamcgirr/ph/data/vcfs/split_pops/population_TB96_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm.vcf -out /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_TB96_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa 
#/home/jamcgirr/apps/angsd/angsd -doSaf 1 -vcf-pl /home/jamcgirr/ph/data/vcfs/split_pops/population_TB06_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm.vcf -out /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_TB06_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa 

#/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_TB91_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_TB96_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx -fold 1 -P 4 > /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/folded_TB91_TB96.sfs 
#/home/jamcgirr/apps/angsd/misc/realSFS fst index /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_TB91_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_TB96_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx -sfs /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/folded_TB91_TB96.sfs -fold 1 -fstout /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/folded_TB91_TB96_persite 
#/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_TB91_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_TB06_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx -fold 1 -P 4 > /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/folded_TB91_TB06.sfs 
#/home/jamcgirr/apps/angsd/misc/realSFS fst index /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_TB91_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_TB06_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx -sfs /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/folded_TB91_TB06.sfs -fold 1 -fstout /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/folded_TB91_TB06_persite 

/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_TB96_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_TB06_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx -fold 1 -P 4 > /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/folded_TB96_TB06.sfs 
/home/jamcgirr/apps/angsd/misc/realSFS fst index /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_TB91_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_TB96_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/population_TB06_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx -sfs /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/folded_TB91_TB96.sfs -sfs /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/folded_TB91_TB06.sfs -sfs /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/folded_TB96_TB06.sfs -fold 1 -fstout /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/folded_TB91_TB96_TB06_persite 
/home/jamcgirr/apps/angsd/misc/realSFS fst stats2 /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/folded_TB91_TB96_TB06_persite.fst.idx -win 50000 -step 10000 > /home/jamcgirr/ph/data/angsd/SFS/split_pops/test_folded/fst_pbs_50kb_win_10kb_step_folded_TB91_TB96_TB06.txt


#command to run: sbatch script_fst_folded_test.sh