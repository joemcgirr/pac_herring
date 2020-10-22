#!/bin/bash

#SBATCH --job-name=test_fold
#SBATCH --mem=16G 
#SBATCH --ntasks=8 
#SBATCH -e test_fold_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_SS17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx -P 8 > /home/jamcgirr/ph/data/angsd/SFS/bamlist_test/test_SS17_nofold.sfs
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS saf2theta /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_SS17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.saf.idx -outname /home/jamcgirr/ph/data/angsd/SFS/bamlist_test/test_SS17_nofold -sfs /home/jamcgirr/ph/data/angsd/SFS/bamlist_test/test_SS17_nofold.sfs
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat /home/jamcgirr/ph/data/angsd/SFS/bamlist_test/test_SS17_nofold.thetas.idx 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat /home/jamcgirr/ph/data/angsd/SFS/bamlist_test/test_SS17_nofold.thetas.idx -win 50000 -step 10000 -outnames test_SS17_nofold.thetasWindow.gz
   
#command to run: sbatch script_test_fold.sh