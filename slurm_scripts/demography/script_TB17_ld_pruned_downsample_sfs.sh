#!/bin/bash

#SBATCH --job-name=TB17_ld_pruned_downsample_sfs
#SBATCH --mem=40G 
#SBATCH --ntasks=8 
#SBATCH -e TB17_ld_pruned_downsample_sfs_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/downsample/saf/TB17_minQ20_minMQ30.saf.idx -P 8 -fold 1 -nSites 100000000 -sites /home/jamcgirr/ph/data/angsd/SFS/downsample/ld_prune/ld_pruned_keep.txt > /home/jamcgirr/ph/data/angsd/SFS/downsample/ld_prune/TB17_minQ20_minMQ30_folded_ld_pruned.sfs 


#run: sbatch script_TB17_ld_pruned_downsample_sfs.sh