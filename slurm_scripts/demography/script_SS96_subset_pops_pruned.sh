#!/bin/bash

#SBATCH --job-name=SS96_subset_pops_pruned
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e SS96_subset_pops_pruned_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

#module load samtools 
#module load bcftools 
#bcftools view -S /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/SS96_plates_1_through_5_rm.txt -Ov /home/jamcgirr/ph/data/vcfs/vince/ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_minMQ30_maxmiss0.5_outliers_rm.vcf.gz -R /home/jamcgirr/ph/data/moments/ld_prune/pruned_keep.txt --threads 4 > /home/jamcgirr/ph/data/moments/ld_prune/vcfs/SS96_pruned.vcf 
/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -doSaf 1 -vcf-pl /home/jamcgirr/ph/data/moments/ld_prune/vcfs/SS96_pruned.vcf -out /home/jamcgirr/ph/data/moments/ld_prune/saf/SS96 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa 

/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/moments/ld_prune/saf/SS96.saf.idx -fold 1 > /home/jamcgirr/ph/data/moments/ld_prune/sfs/SS96_folded.sfs 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/moments/ld_prune/saf/SS96.saf.idx > /home/jamcgirr/ph/data/moments/ld_prune/sfs/SS96_unfolded.sfs 


#command to run: sbatch script_SS96_subset_pops_pruned.sh