#!/bin/bash

#SBATCH --job-name=TB96_PWS96_dadi_2d_sfs
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e TB96_PWS96_dadi_2d_sfs_%A_%a.err 
#SBATCH --time=1:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load perl 
/home/jamcgirr/apps/angsd/misc/realSFS dadi /home/jamcgirr/ph/data/moments/ld_prune/saf/TB96.saf.idx /home/jamcgirr/ph/data/moments/ld_prune/saf/PWS96.saf.idx -sfs /home/jamcgirr/ph/data/moments/ld_prune/sfs/TB96_folded.sfs -sfs /home/jamcgirr/ph/data/moments/ld_prune/sfs/PWS96_folded.sfs -P 4 -ref /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa > /home/jamcgirr/ph/data/moments/2d_sfs_dadi/folded/TB96_PWS96_dadi.sfs 
/home/jamcgirr/apps/moments/AFS-analysis-with-moments/multimodel_inference/realsfs2dadi.pl /home/jamcgirr/ph/data/moments/2d_sfs_dadi/folded/TB96_PWS96_dadi.sfs 73 72 > /home/jamcgirr/ph/data/moments/2d_sfs_dadi/folded/TB96_PWS96_dadi_snp.data 
rm /home/jamcgirr/ph/data/moments/2d_sfs_dadi/folded/TB96_PWS96_dadi.sfs 

/home/jamcgirr/apps/angsd/misc/realSFS dadi /home/jamcgirr/ph/data/moments/ld_prune/saf/TB96.saf.idx /home/jamcgirr/ph/data/moments/ld_prune/saf/PWS96.saf.idx -sfs /home/jamcgirr/ph/data/moments/ld_prune/sfs/TB96_unfolded.sfs -sfs /home/jamcgirr/ph/data/moments/ld_prune/sfs/PWS96_unfolded.sfs -P 4 -ref /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa > /home/jamcgirr/ph/data/moments/2d_sfs_dadi/unfolded/TB96_PWS96_dadi.sfs 
/home/jamcgirr/apps/moments/AFS-analysis-with-moments/multimodel_inference/realsfs2dadi.pl /home/jamcgirr/ph/data/moments/2d_sfs_dadi/unfolded/TB96_PWS96_dadi.sfs 73 72 > /home/jamcgirr/ph/data/moments/2d_sfs_dadi/unfolded/TB96_PWS96_dadi_snp.data 
rm /home/jamcgirr/ph/data/moments/2d_sfs_dadi/unfolded/TB96_PWS96_dadi.sfs 



#command to run: sbatch script_TB96_PWS96_dadi_2d_sfs.sh