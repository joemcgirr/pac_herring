#!/bin/bash

#SBATCH --job-name=vep
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e vep_%A_%a.err 
#SBATCH --time=72:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/ph/data/LoF/ensembl-vep/vep --input_file /home/jamcgirr/ph/data/LoF/snp_table_VEP_standard_format.txt --output_file /home/jamcgirr/ph/data/LoF/test_output.txt --cache --species clupea_harengus 


#run: sbatch script_vep.sh