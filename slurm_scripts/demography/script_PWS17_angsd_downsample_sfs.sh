#!/bin/bash

#SBATCH --job-name=PWS17_angsd_downsample_sfs
#SBATCH --mem=8G 
#SBATCH --ntasks=8 
#SBATCH -e PWS17_angsd_downsample_sfs_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -bam /home/jamcgirr/ph/data/angsd/SFS/downsample/downsample_bams_PWS17.txt -r chr1:1-5000000 -doSaf 1 -doMajorMinor 1 -doMaf 3 -doCounts 1 -doGlf 3 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -ref /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -minMapQ 30 -minQ 20 -GL 1 -P 8 -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 -minInd 10 -setMinDepth 10 -setMaxDepth 100 -out /home/jamcgirr/ph/data/moments/downsample/chr1_5mb/PWS17 

/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/moments/downsample/chr1_5mb/PWS17.saf.idx -P 8 -fold 1 > /home/jamcgirr/ph/data/moments/downsample/chr1_5mb/PWS17_folded.sfs 


#run: sbatch script_PWS17_angsd_downsample_sfs.sh