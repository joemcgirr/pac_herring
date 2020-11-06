#!/bin/bash

#SBATCH --job-name=moments_pipeline_test
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e moments_pipeline_test_%A_%a.err 
#SBATCH --time=72:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

source /home/jamcgirr/apps/my_python3.7/bin/activate
#python moments_Run_Optimizations.py
python Simulate_and_Optimize.py


#command to run: sbatch script_moments_pipeline_test.sh