#!/bin/bash

#SBATCH --job-name=TB91_6_3_v_TB96_9_3_v_TB96_9_4_fst_8x8
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e TB91_6_3_v_TB96_9_3_v_TB96_9_4_fst_8x8_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load samtools 
module load bcftools 
bcftools view -S /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/SFS_by_row/TB91_6_3.txt -Ov /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.vcf > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3.vcf 
bcftools view -S /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/SFS_by_row/TB96_9_3.txt -Ov /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.vcf > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB96_9_3.vcf 
bcftools view -S /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/SFS_by_row/TB96_9_4.txt -Ov /home/jamcgirr/ph/data/vcfs/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5.vcf > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB96_9_4.vcf 

/home/jamcgirr/apps/angsd/angsd -doSaf 1 -vcf-pl /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3.vcf -out /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa 
/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3.saf.idx -P 4 -fold 1 > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3.sfs 
/home/jamcgirr/apps/angsd/angsd -doSaf 1 -vcf-pl /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB96_9_3.vcf -out /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB96_9_3 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa 
/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB96_9_3.saf.idx -P 4 -fold 1 > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB96_9_3.sfs 
/home/jamcgirr/apps/angsd/angsd -doSaf 1 -vcf-pl /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB96_9_4.vcf -out /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB96_9_4 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa 
/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB96_9_4.saf.idx -P 4 -fold 1 > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB96_9_4.sfs 

/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3.saf.idx /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB96_9_3.saf.idx -P 4 > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_9_3.ml 
/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3.saf.idx /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB96_9_4.saf.idx -P 4 > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_9_4.ml 
/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB96_9_3.saf.idx /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB96_9_4.saf.idx -P 4 > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB96_9_3_TB96_9_4.ml 

/home/jamcgirr/apps/angsd/misc/realSFS fst index /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3.saf.idx /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB96_9_3.saf.idx /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB96_9_4.saf.idx -sfs /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_9_3.ml -sfs /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_9_4.ml -sfs /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB96_9_3_TB96_9_4.ml -fstout /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_9_3_TB96_9_4  
/home/jamcgirr/apps/angsd/misc/realSFS fst stats2 /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/TB91_6_3_TB96_9_3_TB96_9_4.fst.idx -win 50000 -step 10000 > /home/jamcgirr/ph/data/vcfs/split_pops/split_by_row/fst_50kb_win_TB91_6_3_TB96_9_3_TB96_9_4.txt 


#command to run: sbatch script_TB91_6_3_v_TB96_9_3_v_TB96_9_4_fst_8x8.sh