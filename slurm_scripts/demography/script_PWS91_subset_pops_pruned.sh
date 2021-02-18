#!/bin/bash

#SBATCH --job-name=PWS91_subset_pops_pruned
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e PWS91_subset_pops_pruned_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load samtools 
module load bcftools 

bcftools view -S /home/jamcgirr/ph/scripts/angsd/SFS/SFS_by_pop/PWS91_plates_1_through_5_rm.txt -Oz /home/jamcgirr/ph/data/moments/vcfs/ph_filtered_snps_minDP1600_maxDP2000_minQ20_minMQ30_NS0.7_ld0.1.vcf.gz --threads 4 > /home/jamcgirr/ph/data/moments/ld_prune/vcfs/PWS91_ph_filtered_snps_minDP1600_maxDP2000_minQ20_minMQ30_NS0.7_ld0.1.vcf.gz 
/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -doSaf 1 -vcf-pl /home/jamcgirr/ph/data/moments/ld_prune/vcfs/PWS91_ph_filtered_snps_minDP1600_maxDP2000_minQ20_minMQ30_NS0.7_ld0.1.vcf.gz -out /home/jamcgirr/ph/data/moments/ld_prune/saf/PWS91 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa 

/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/moments/ld_prune/saf/PWS91.saf.idx -fold 1 > /home/jamcgirr/ph/data/moments/ld_prune/sfs/PWS91_folded.sfs 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/moments/ld_prune/saf/PWS91.saf.idx > /home/jamcgirr/ph/data/moments/ld_prune/sfs/PWS91_unfolded.sfs 


#command to run: sbatch script_PWS91_subset_pops_pruned.sh