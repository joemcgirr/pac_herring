#!/bin/bash

#SBATCH --job-name=SS06_SS17_freqs_perms
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e SS06_SS17_freqs_perms_%A_%a.err 
#SBATCH --time=144:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

