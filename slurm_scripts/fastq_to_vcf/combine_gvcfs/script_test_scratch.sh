#!/bin/bash

#SBATCH --job-name=test_scratch
#SBATCH --mem=8G
#SBATCH --ntasks=1
#SBATCH --time=8:00:00
#SBATCH -e test_scratch_%A_%a.err
#SBATCH --mail-user=jamcgirr@ucdavis.edu
#SBATCH --mail-type=ALL
#SBATCH -p low


# mkdir -p /home/jamcgirr/test_delete
# cp /home/jamcgirr/ph/combine_gvcfs/ph.gvcfs_map /home/jamcgirr/test_delete

mkdir -p /scratch/jamcgirr/test_delete
cp /home/jamcgirr/ph/combine_gvcfs/ph.gvcfs_map /scratch/jamcgirr/test_delete


#command to run it on longleaf is sbatch script_test_scratch.sh