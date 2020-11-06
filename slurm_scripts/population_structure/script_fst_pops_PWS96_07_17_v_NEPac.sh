#!/bin/bash

#SBATCH --job-name=fst_pops_PWS96_07_17_v_NEPac
#SBATCH --mem=16G 
#SBATCH --ntasks=8 
#SBATCH -e fst_pops_PWS96_07_17_v_NEPac_%A_%a.err 
#SBATCH --time=144:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

# module load samtools 
# module load bcftools 
# cat /home/jamcgirr/ph/data/angsd/SFS/thetas/SS96_bams_p_1_5_rm.txt /home/jamcgirr/ph/data/angsd/SFS/thetas/SS06_bams_p_1_5_rm.txt /home/jamcgirr/ph/data/angsd/SFS/thetas/SS17_bams_p_1_5_rm.txt /home/jamcgirr/ph/data/angsd/SFS/thetas/BC17_bams_p_1_5_rm.txt /home/jamcgirr/ph/data/angsd/SFS/thetas/WA17_bams_p_1_5_rm.txt > /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_NEPac.txt 
# sed -i 's/\/home\/eoziolor\/phpopg\/data\/align\///g' /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_NEPac.txt 
# sed -i 's/.bam//g' /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_NEPac.txt 
# 
# # cat /home/jamcgirr/ph/data/angsd/SFS/thetas/PWS96_bams_p_1_5_rm.txt /home/jamcgirr/ph/data/angsd/SFS/thetas/PWS07_bams_p_1_5_rm.txt /home/jamcgirr/ph/data/angsd/SFS/thetas/PWS17_bams_p_1_5_rm.txt > /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_PWS96_07_17.txt 
# # sed -i 's/\/home\/eoziolor\/phpopg\/data\/align\///g' /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_PWS96_07_17.txt 
# # sed -i 's/.bam//g' /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_PWS96_07_17.txt 
# 
# #bcftools view -S /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_PWS96_07_17.txt -Ov /home/jamcgirr/ph/data/vcfs/vince/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf.gz --threads 4 > /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_PWS96_07_17.vcf 
# bcftools view -S /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_NEPac.txt -Ov /home/jamcgirr/ph/data/vcfs/vince/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf.gz --threads 4 > /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_NEPac.vcf 
# 
/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -doSaf 1 -vcf-pl /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_PWS96_07_17.vcf -out /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_PWS96_07_17 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa
/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -doSaf 1 -vcf-pl /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_NEPac.vcf -out /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_NEPac -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa 

#rm /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_PWS96_07_17.vcfrm /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_NEPac.vcf#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_PWS96_07_17.saf.idx -P 4 -fold 1 > /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_PWS96_07_17.sfs 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_NEPac.saf.idx -P 8 -fold 1 > /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_NEPac.sfs 

/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_PWS96_07_17.saf.idx /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_NEPac.saf.idx -fold 1 -P 8 > /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_PWS96_07_17_v_NEPac.sfs 

/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS fst index /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_PWS96_07_17.saf.idx /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_NEPac.saf.idx -sfs /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_PWS96_07_17_v_NEPac.sfs -fold 1 -fstout /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_PWS96_07_17_v_NEPac 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS fst stats2 /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_PWS96_07_17_v_NEPac.fst.idx -win 50000 -step 10000 > /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/fst_50kb_win_10kb_step_folded_pops_PWS96_07_17_v_NEPac.txt
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS fst print /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/pops_PWS96_07_17_v_NEPac.fst.idx > /home/jamcgirr/ph/data/angsd/SFS/fst_fixed_PWS/fst_persite_folded_pops_PWS96_07_17_v_NEPac.txt

#run: sbatch script_fst_pops_PWS96_07_17_v_NEPac.sh