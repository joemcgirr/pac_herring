#!/bin/bash

#SBATCH --job-name=PWS17_SS17_dadi_2d_sfs_downsample
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e PWS17_SS17_dadi_2d_sfs_downsample_%A_%a.err 
#SBATCH --time=1:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 


#command to run: sbatch script_PWS17_SS17_dadi_2d_sfs_downsample.sh