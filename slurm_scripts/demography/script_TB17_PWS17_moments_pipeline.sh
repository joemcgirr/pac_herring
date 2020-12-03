#!/bin/bash

#SBATCH --job-name=TB17_PWS17_moments_pipeline
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e TB17_PWS17_moments_pipeline_%A_%a.err 
#SBATCH --time=144:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

#sed -i 's/pop0/TB17/g' /home/jamcgirr/ph/data/moments/2d_sfs_dadi/folded/TB17_PWS17_dadi_snp.data 
#sed -i 's/pop1/PWS17/g' /home/jamcgirr/ph/data/moments/2d_sfs_dadi/folded/TB17_PWS17_dadi_snp.data 
#sed -i 's/REF/Ingroup/g' /home/jamcgirr/ph/data/moments/2d_sfs_dadi/folded/TB17_PWS17_dadi_snp.data 
#sed -i 's/OUT/Outgroup/g' /home/jamcgirr/ph/data/moments/2d_sfs_dadi/folded/TB17_PWS17_dadi_snp.data 
source /home/jamcgirr/apps/my_python3.7/bin/activate 
python moments_Run_Optimizations.py 
#python Simulate_and_Optimize.py 


#command to run: sbatch script_TB17_PWS17_moments_pipeline.sh