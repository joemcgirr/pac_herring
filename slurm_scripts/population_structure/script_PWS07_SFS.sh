#!/bin/bash

#SBATCH --job-name=PWS07_SFS
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e PWS07_SFS_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -doSaf 1 -vcf-pl /home/jamcgirr/ph/data/vcfs/split_pops/maf05/population_PWS07_ph_filtered_snps_minDP600_maxDP2000_minQ20_minMQ30_NS0.5_maf0.05.vcf.gz -out /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/PWS07 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/PWS07.saf.idx -P 4 -fold 1 > /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/PWS07_folded.sfs 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/PWS07.saf.idx -P 4 > /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/PWS07_unfolded.sfs 


#command to run: sbatch script_PWS07_SFS.sh