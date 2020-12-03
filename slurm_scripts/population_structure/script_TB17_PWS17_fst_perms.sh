#!/bin/bash

#SBATCH --job-name=TB17_PWS17_fst_perms
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e TB17_PWS17_fst_perms_%A_%a.err 
#SBATCH --time=72:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

cat /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/TB17_plates_1_through_5_rm.txt /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/PWS17_plates_1_through_5_rm.txt > /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/perms/popsTB17PWS17.txt 
shuf /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/perms/popsTB17PWS17.txt > /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/perms/shufpopsTB17PWS17.txt 
head -72 /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/perms/shufpopsTB17PWS17.txt > /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/perms/shufpopTB17.txt 
tail -56 /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/perms/shufpopsTB17PWS17.txt > /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/perms/shufpopPWS17.txt 

module load samtools 
module load bcftools 
bcftools view -S /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/perms/shufpopTB17.txt -Ov /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf.gz > /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/perms/shufpopTB17.vcf 
bcftools view -S /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/perms/shufpopPWS17.txt -Ov /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf.gz > /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/perms/shufpopPWS17.vcf 

/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -doSaf 1 -vcf-pl /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/perms/shufpopTB17.vcf -out /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/perms/shufpopTB17 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa 
/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -doSaf 1 -vcf-pl /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/perms/shufpopPWS17.vcf -out /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/perms/shufpopPWS17 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa 
/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/perms/shufpopTB17.saf.idx /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/perms/shufpopPWS17.saf.idx -P 4 -fold 1 > /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/perms/shufpopsTB17PWS17.sfs 
/home/jamcgirr/apps/angsd/misc/realSFS fst index /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/perms/shufpopTB17.saf.idx /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/perms/shufpopPWS17.saf.idx -sfs /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/perms/shufpopsTB17PWS17.sfs -fold 1 -fstout /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/perms/shufpopsTB17PWS17_persite 
/home/jamcgirr/apps/angsd/misc/realSFS fst stats2 /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/perms/shufpopsTB17PWS17_persite.fst.idx -win 50000 -step 10000 > /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/perms/shufpopsTB17PWS17_fst_pbs_50kb_win_10kb_step_folded.txt 


#command to run: sbatch script_TB17_PWS17_fst_perms.sh