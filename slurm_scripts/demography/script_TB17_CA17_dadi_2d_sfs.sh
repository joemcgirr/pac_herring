#!/bin/bash

#SBATCH --job-name=TB17_CA17_dadi_2d_sfs
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e TB17_CA17_dadi_2d_sfs_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load perl 
/home/jamcgirr/apps/angsd/misc/realSFS dadi /home/jamcgirr/ph/data/moments/ld_prune/saf/TB17.saf.idx /home/jamcgirr/ph/data/moments/ld_prune/saf/CA17.saf.idx -sfs /home/jamcgirr/ph/data/moments/ld_prune/sfs/TB17_folded.sfs -sfs /home/jamcgirr/ph/data/moments/ld_prune/sfs/CA17_folded.sfs -P 4 -ref /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa > /home/jamcgirr/ph/data/moments/2d_sfs_dadi/folded/TB17_CA17_dadi.sfs 
/home/jamcgirr/apps/moments/AFS-analysis-with-moments/multimodel_inference/realsfs2dadi.pl /home/jamcgirr/ph/data/moments/2d_sfs_dadi/folded/TB17_CA17_dadi.sfs 72 70 > /home/jamcgirr/ph/data/moments/2d_sfs_dadi/folded/TB17_CA17_dadi_snp.data 
rm /home/jamcgirr/ph/data/moments/2d_sfs_dadi/folded/TB17_CA17_dadi.sfs 

/home/jamcgirr/apps/angsd/misc/realSFS dadi /home/jamcgirr/ph/data/moments/ld_prune/saf/TB17.saf.idx /home/jamcgirr/ph/data/moments/ld_prune/saf/CA17.saf.idx -sfs /home/jamcgirr/ph/data/moments/ld_prune/sfs/TB17_unfolded.sfs -sfs /home/jamcgirr/ph/data/moments/ld_prune/sfs/CA17_unfolded.sfs -P 4 -ref /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa > /home/jamcgirr/ph/data/moments/2d_sfs_dadi/unfolded/TB17_CA17_dadi.sfs 
/home/jamcgirr/apps/moments/AFS-analysis-with-moments/multimodel_inference/realsfs2dadi.pl /home/jamcgirr/ph/data/moments/2d_sfs_dadi/unfolded/TB17_CA17_dadi.sfs 72 70 > /home/jamcgirr/ph/data/moments/2d_sfs_dadi/unfolded/TB17_CA17_dadi_snp.data 
rm /home/jamcgirr/ph/data/moments/2d_sfs_dadi/unfolded/TB17_CA17_dadi.sfs 



#command to run: sbatch script_TB17_CA17_dadi_2d_sfs.sh