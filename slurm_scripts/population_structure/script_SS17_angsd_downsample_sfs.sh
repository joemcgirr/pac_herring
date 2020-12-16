#!/bin/bash

#SBATCH --job-name=SS17_angsd_downsample_sfs
#SBATCH --mem=40G 
#SBATCH --ntasks=8 
#SBATCH -e SS17_angsd_downsample_sfs_%A_%a.err 
#SBATCH --time=48:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

#shuf /home/jamcgirr/ph/data/angsd/SFS/bamlist_test/SS17_bams_p_1_5_rm.txt | head -41 > /home/jamcgirr/ph/data/angsd/SFS/downsample/downsample_bams_SS17.txt 

#/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -bam /home/jamcgirr/ph/data/angsd/SFS/downsample/downsample_bams_SS17.txt -doSaf 1 -doMajorMinor 1 -doMaf 3 -doCounts 1 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -ref /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -minMapQ 30 -minQ 20 -GL 1 -P 8 -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 -minInd 10 -setMinDepth 10 -setMaxDepth 100 -out /home/jamcgirr/ph/data/angsd/SFS/downsample/SS17_minQ20_minMQ30 

/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/downsample/SS17_minQ20_minMQ30.saf.idx -P 8 -fold 1 -nSites 100000000 > /home/jamcgirr/ph/data/angsd/SFS/downsample/SS17_minQ20_minMQ30_folded.sfs 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/downsample/SS17_minQ20_minMQ30.saf.idx -P 8 -nSites 100000000 > /home/jamcgirr/ph/data/angsd/SFS/downsample/SS17_minQ20_minMQ30_unfolded.sfs 


#run: sbatch script_SS17_angsd_downsample_sfs.sh