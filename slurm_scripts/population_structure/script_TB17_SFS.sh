#!/bin/bash

#SBATCH --job-name=TB17_SFS
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e TB17_SFS_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

#/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -doSaf 1 -vcf-pl /home/jamcgirr/ph/data/vcfs/split_pops/population_TB17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_plates_1_5_rm.vcf -out /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_TB17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa 
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_TB17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx -P 4 -fold 1 > /home/jamcgirr/ph/data/angsd/SFS/split_pops/folded/population_TB17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.sfs 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_TB17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx -P 4 > /home/jamcgirr/ph/data/angsd/SFS/split_pops/unfolded/population_TB17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.sfs 


#command to run: sbatch script_TB17_SFS.sh