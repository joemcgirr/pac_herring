#!/bin/bash

#SBATCH --job-name=PWS17_TB17_dadi_2d_sfs_downsample
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e PWS17_TB17_dadi_2d_sfs_downsample_%A_%a.err 
#SBATCH --time=1:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load perl 
/home/jamcgirr/apps/angsd/misc/realSFS dadi /home/jamcgirr/ph/data/moments/downsample/chr1_5mb/PWS17.saf.idx /home/jamcgirr/ph/data/moments/downsample/chr1_5mb/TB17.saf.idx -sfs /home/jamcgirr/ph/data/moments/downsample/chr1_5mb/PWS17_folded.sfs -sfs /home/jamcgirr/ph/data/moments/downsample/chr1_5mb/TB17_folded.sfs -P 4 -ref /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa > /home/jamcgirr/ph/data/moments/downsample/chr1_5mb/PWS17_TB17_dadi.sfs 
/home/jamcgirr/apps/moments/AFS-analysis-with-moments/multimodel_inference/realsfs2dadi.pl /home/jamcgirr/ph/data/moments/downsample/chr1_5mb/PWS17_TB17_dadi.sfs 41 41 > /home/jamcgirr/ph/data/moments/downsample/chr1_5mb/PWS17_TB17_dadi_snp.data 
sed -i 's/pop0/PWS17/g' /home/jamcgirr/ph/data/moments/downsample/chr1_5mb/PWS17_TB17_dadi_snp.data
sed -i 's/pop1/TB17/g' /home/jamcgirr/ph/data/moments/downsample/chr1_5mb/PWS17_TB17_dadi_snp.data
sed -i 's/REF/Ingroup/g' /home/jamcgirr/ph/data/moments/downsample/chr1_5mb/PWS17_TB17_dadi_snp.data
sed -i 's/OUT/Outgroup/g' /home/jamcgirr/ph/data/moments/downsample/chr1_5mb/PWS17_TB17_dadi_snp.data
rm /home/jamcgirr/ph/data/moments/downsample/chr1_5mb/PWS17_TB17_dadi.sfs 



#command to run: sbatch script_PWS17_TB17_dadi_2d_sfs_downsample.sh