#!/bin/bash

#SBATCH --job-name=BC17_CA17_2d_sfs_downsample
#SBATCH --mem=8G 
#SBATCH --ntasks=8 
#SBATCH -e BC17_CA17_2d_sfs_downsample_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/downsample/saf/BC17_minQ20_minMQ30.saf.idx /home/jamcgirr/ph/data/angsd/SFS/downsample/saf/CA17_minQ20_minMQ30.saf.idx -fold 1 -P 8 -nSites 100000000 > /home/jamcgirr/ph/data/angsd/SFS/downsample/fst/folded/BC17_CA17_folded_chunks.sfs 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/downsample/saf/BC17_minQ20_minMQ30.saf.idx /home/jamcgirr/ph/data/angsd/SFS/downsample/saf/CA17_minQ20_minMQ30.saf.idx -fold 1 -P 8 > /home/jamcgirr/ph/data/angsd/SFS/downsample/fst/folded/BC17_CA17_folded_full.sfs 


#command to run: sbatch script_BC17_CA17_2d_sfs_downsample.sh