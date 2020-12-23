#!/bin/bash

#SBATCH --job-name=PWS07_angsd_downsample_sfs
#SBATCH --mem=40G 
#SBATCH --ntasks=8 
#SBATCH -e PWS07_angsd_downsample_sfs_%A_%a.err 
#SBATCH --time=48:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 



#run: sbatch script_fst_test.sh