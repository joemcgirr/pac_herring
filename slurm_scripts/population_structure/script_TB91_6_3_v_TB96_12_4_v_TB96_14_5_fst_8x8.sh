#!/bin/bash

#SBATCH --job-name=TB91_6_3_v_TB96_12_4_v_TB96_14_5_fst_8x8
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e TB91_6_3_v_TB96_12_4_v_TB96_14_5_fst_8x8_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load samtools 
module load bcftools 

mkdir /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/ 

bcftools view -S /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/SFS_by_row/TB91_6_3.txt -Ov /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.vcf > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB91_6_3.vcf 
bcftools view -S /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/SFS_by_row/TB96_12_4.txt -Ov /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.vcf > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB96_12_4.vcf 
bcftools view -S /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/SFS_by_row/TB96_14_5.txt -Ov /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.vcf > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB96_14_5.vcf 

/home/jamcgirr/apps/angsd/angsd -doSaf 1 -vcf-pl /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB91_6_3.vcf -out /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB91_6_3 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa 
/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB91_6_3.saf.idx -P 4 -fold 1 > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB91_6_3.sfs 
/home/jamcgirr/apps/angsd/angsd -doSaf 1 -vcf-pl /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB96_12_4.vcf -out /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB96_12_4 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa 
/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB96_12_4.saf.idx -P 4 -fold 1 > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB96_12_4.sfs 
/home/jamcgirr/apps/angsd/angsd -doSaf 1 -vcf-pl /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB96_14_5.vcf -out /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB96_14_5 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa 
/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB96_14_5.saf.idx -P 4 -fold 1 > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB96_14_5.sfs 
/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB91_6_3.saf.idx /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB96_12_4.saf.idx -P 4 > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB91_6_3_TB96_12_4.ml 
/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB91_6_3.saf.idx /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB96_14_5.saf.idx -P 4 > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB91_6_3_TB96_14_5.ml 
/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB96_12_4.saf.idx /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB96_14_5.saf.idx -P 4 > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB96_12_4_TB96_14_5.ml 

/home/jamcgirr/apps/angsd/misc/realSFS fst index /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB91_6_3.saf.idx /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB96_12_4.saf.idx /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB96_14_5.saf.idx -sfs /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB91_6_3_TB96_12_4.ml -sfs /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB91_6_3_TB96_14_5.ml -sfs /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB96_12_4_TB96_14_5.ml -fstout /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB91_6_3_TB96_12_4_TB96_14_5  
/home/jamcgirr/apps/angsd/misc/realSFS fst stats2 /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/TB91_6_3_TB96_12_4_TB96_14_5.fst.idx -win 50000 -step 10000 > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/fst_50kb_win_TB91_6_3_TB96_12_4_TB96_14_5.txt 

awk '{ total += $5 } END { print total/NR }' /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/fst_50kb_win_TB91_6_3_TB96_12_4_TB96_14_5.txt > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/means/fst_50kb_win_genome_mean_TB91_6_3_TB96_12_4.txt 
awk '{ total += $6 } END { print total/NR }' /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/fst_50kb_win_TB91_6_3_TB96_12_4_TB96_14_5.txt > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/means/fst_50kb_win_genome_mean_TB91_6_3_TB96_14_5.txt 
awk '{ total += $7 } END { print total/NR }' /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/fst_50kb_win_TB91_6_3_TB96_12_4_TB96_14_5.txt > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/means/fst_50kb_win_genome_mean_TB96_12_4_TB96_14_5.txt 

rm -r /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_12_4_TB96_14_5/ 



#command to run: sbatch script_TB91_6_3_v_TB96_12_4_v_TB96_14_5_fst_8x8.sh