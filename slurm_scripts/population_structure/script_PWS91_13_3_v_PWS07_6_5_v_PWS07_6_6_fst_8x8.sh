#!/bin/bash

#SBATCH --job-name=PWS91_13_3_v_PWS07_6_5_v_PWS07_6_6_fst_8x8
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e PWS91_13_3_v_PWS07_6_5_v_PWS07_6_6_fst_8x8_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load samtools 
module load bcftools 

mkdir /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/ 

bcftools view -S /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/SFS_by_row/PWS91_13_3.txt -Ov /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.vcf > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS91_13_3.vcf 
bcftools view -S /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/SFS_by_row/PWS07_6_5.txt -Ov /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.vcf > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS07_6_5.vcf 
bcftools view -S /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/SFS_by_row/PWS07_6_6.txt -Ov /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.vcf > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS07_6_6.vcf 

/home/jamcgirr/apps/angsd/angsd -doSaf 1 -vcf-pl /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS91_13_3.vcf -out /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS91_13_3 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa 
/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS91_13_3.saf.idx -P 4 -fold 1 > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS91_13_3.sfs 
/home/jamcgirr/apps/angsd/angsd -doSaf 1 -vcf-pl /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS07_6_5.vcf -out /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS07_6_5 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa 
/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS07_6_5.saf.idx -P 4 -fold 1 > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS07_6_5.sfs 
/home/jamcgirr/apps/angsd/angsd -doSaf 1 -vcf-pl /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS07_6_6.vcf -out /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS07_6_6 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa 
/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS07_6_6.saf.idx -P 4 -fold 1 > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS07_6_6.sfs 
/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS91_13_3.saf.idx /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS07_6_5.saf.idx -P 4 > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS91_13_3_PWS07_6_5.ml 
/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS91_13_3.saf.idx /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS07_6_6.saf.idx -P 4 > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS91_13_3_PWS07_6_6.ml 
/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS07_6_5.saf.idx /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS07_6_6.saf.idx -P 4 > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS07_6_5_PWS07_6_6.ml 

/home/jamcgirr/apps/angsd/misc/realSFS fst index /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS91_13_3.saf.idx /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS07_6_5.saf.idx /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS07_6_6.saf.idx -sfs /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS91_13_3_PWS07_6_5.ml -sfs /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS91_13_3_PWS07_6_6.ml -sfs /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS07_6_5_PWS07_6_6.ml -fstout /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS91_13_3_PWS07_6_5_PWS07_6_6  
/home/jamcgirr/apps/angsd/misc/realSFS fst stats2 /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/PWS91_13_3_PWS07_6_5_PWS07_6_6.fst.idx -win 50000 -step 10000 > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/fst_50kb_win_PWS91_13_3_PWS07_6_5_PWS07_6_6.txt 

awk '{ total += $5 } END { print total/NR }' /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/fst_50kb_win_PWS91_13_3_PWS07_6_5_PWS07_6_6.txt > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/means/fst_50kb_win_genome_mean_PWS91_13_3_PWS07_6_5.txt 
awk '{ total += $6 } END { print total/NR }' /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/fst_50kb_win_PWS91_13_3_PWS07_6_5_PWS07_6_6.txt > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/means/fst_50kb_win_genome_mean_PWS91_13_3_PWS07_6_6.txt 
awk '{ total += $7 } END { print total/NR }' /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/fst_50kb_win_PWS91_13_3_PWS07_6_5_PWS07_6_6.txt > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/means/fst_50kb_win_genome_mean_PWS07_6_5_PWS07_6_6.txt 

rm -r /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/PWS91_13_3_PWS07_6_5_PWS07_6_6/ 



#command to run: sbatch script_PWS91_13_3_v_PWS07_6_5_v_PWS07_6_6_fst_8x8.sh