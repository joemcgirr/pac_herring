#!/bin/bash

#SBATCH --job-name=SS17_angsd_downsample_sfs
#SBATCH --mem=8G 
#SBATCH --ntasks=8 
#SBATCH -e SS17_angsd_downsample_sfs_%A_%a.err 
#SBATCH --time=144:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -bam /home/jamcgirr/ph/data/angsd/SFS/downsample/downsample_bams_SS17.txt -doSaf 1 -doMajorMinor 1 -doMaf 3 -SNP_pval 1e-6 -doCounts 1 -doGlf 3 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -ref /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -minMapQ 30 -minQ 20 -GL 1 -P 8 -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 -minInd 10 -setMinDepth 10 -setMaxDepth 100 -out /home/jamcgirr/ph/data/mushi/light_snp_call/SS17 

/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/mushi/light_snp_call/SS17.saf.idx -P 8 -fold 1 > /home/jamcgirr/ph/data/mushi/light_snp_call/SS17_folded.sfs 


#run: sbatch script_SS17_angsd_downsample_sfs.sh