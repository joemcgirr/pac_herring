#!/bin/bash

#SBATCH --job-name=_SFS
#SBATCH --mem=16G 
#SBATCH --ntasks=4 
#SBATCH -e _SFS_%A_%a.err 
#SBATCH --time=48:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

INFO='##INFO=<ID=INDEL,Number=0,Type=Flag,Description="">' 
awk -v infohdr=$INFO '/^#CHROM/ {print infohdr"\n"$0} !/^#CHROM/' /home/jamcgirr/ph/data/vcfs/split_pops/population_WA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.vcf > /home/jamcgirr/ph/data/vcfs/split_pops/population_WA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.angsdSFS.vcf 

module load angsd 
angsd -doSaf 1 -vcf-pl /home/jamcgirr/ph/data/vcfs/split_pops/population_WA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.angsdSFS.vcf -out /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_WA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa 
realSFS /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_WA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.saf.idx -P 4 -fold 1 > /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_WA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.sfs 
realSFS saf2theta /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_WA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.saf.idx -sfs /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_WA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.sfs -outname /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_WA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5 
thetaStat do_stat /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_WA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.thetas.idx 
thetaStat do_stat /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_WA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.thetas.idx -win 50000 -step 10000 -outnames /home/jamcgirr/ph/data/angsd/SFS/split_pops/population_WA17_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5_theta.thetas50kbWindow.gz 


#command to run: sbatch script__SFS.sh