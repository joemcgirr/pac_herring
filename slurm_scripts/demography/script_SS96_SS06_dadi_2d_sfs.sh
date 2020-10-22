#!/bin/bash

#SBATCH --job-name=SS96_SS06_dadi_2d_sfs
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e SS96_SS06_dadi_2d_sfs_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load perl 
/home/jamcgirr/apps/angsd/misc/realSFS dadi /home/jamcgirr/ph/data/moments/ld_prune/saf/SS96.saf.idx /home/jamcgirr/ph/data/moments/ld_prune/saf/SS06.saf.idx -sfs /home/jamcgirr/ph/data/moments/ld_prune/sfs/SS96_folded.sfs -sfs /home/jamcgirr/ph/data/moments/ld_prune/sfs/SS06_folded.sfs -P 4 -ref /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa > /home/jamcgirr/ph/data/moments/2d_sfs_dadi/folded/SS96_SS06_dadi.sfs 
/home/jamcgirr/apps/moments/AFS-analysis-with-moments/multimodel_inference/realsfs2dadi.pl /home/jamcgirr/ph/data/moments/2d_sfs_dadi/folded/SS96_SS06_dadi.sfs 78 41 > /home/jamcgirr/ph/data/moments/2d_sfs_dadi/folded/SS96_SS06_dadi_snp.data 
rm /home/jamcgirr/ph/data/moments/2d_sfs_dadi/folded/SS96_SS06_dadi.sfs 

/home/jamcgirr/apps/angsd/misc/realSFS dadi /home/jamcgirr/ph/data/moments/ld_prune/saf/SS96.saf.idx /home/jamcgirr/ph/data/moments/ld_prune/saf/SS06.saf.idx -sfs /home/jamcgirr/ph/data/moments/ld_prune/sfs/SS96_unfolded.sfs -sfs /home/jamcgirr/ph/data/moments/ld_prune/sfs/SS06_unfolded.sfs -P 4 -ref /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa > /home/jamcgirr/ph/data/moments/2d_sfs_dadi/unfolded/SS96_SS06_dadi.sfs 
/home/jamcgirr/apps/moments/AFS-analysis-with-moments/multimodel_inference/realsfs2dadi.pl /home/jamcgirr/ph/data/moments/2d_sfs_dadi/unfolded/SS96_SS06_dadi.sfs 78 41 > /home/jamcgirr/ph/data/moments/2d_sfs_dadi/unfolded/SS96_SS06_dadi_snp.data 
rm /home/jamcgirr/ph/data/moments/2d_sfs_dadi/unfolded/SS96_SS06_dadi.sfs 



#command to run: sbatch script_SS96_SS06_dadi_2d_sfs.sh