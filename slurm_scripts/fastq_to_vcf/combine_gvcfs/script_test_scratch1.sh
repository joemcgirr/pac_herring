#!/bin/bash

#SBATCH --job-name=test_scratch1
#SBATCH --mem=8G
#SBATCH --ntasks=1
#SBATCH --time=8:00:00
#SBATCH -e test_scratch1_%A_%a.err
#SBATCH --mail-user=jamcgirr@ucdavis.edu
#SBATCH --mail-type=ALL
#SBATCH -p low

# This works
# mkdir -p /home/jamcgirr/test_delete
# cp /home/jamcgirr/ph/combine_gvcfs/ph.gvcfs_map /home/jamcgirr/test_delete

# This doesn't work (/scratch/jamcgirr/test_delete is not written)
mkdir -p /scratch/jamcgirr/test_delete
cp /home/jamcgirr/ph/combine_gvcfs/ph.gvcfs_map /scratch/jamcgirr/test_delete


#command to run it on longleaf is sbatch script_test_scratch1.sh