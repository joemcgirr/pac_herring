#!/bin/bash

#SBATCH --job-name=SS17_WA17_2d_sfs
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e SS17_WA17_2d_sfs_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/SS17.saf.idx /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/WA17.saf.idx -fold 1 -P 4 > /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/maf05/folded_SS17_WA17.sfs 
/home/jamcgirr/apps/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/SS17.saf.idx /home/jamcgirr/ph/data/angsd/SFS/vcf/maf05/WA17.saf.idx -P 4 > /home/jamcgirr/ph/data/angsd/SFS/fst_pbs/maf05/unfolded_SS17_WA17.sfs 


#command to run: sbatch script_SS17_WA17_2d_sfs.sh