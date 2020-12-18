#!/bin/bash

#SBATCH --job-name=PWS07_ngsLD_downsample
#SBATCH --mem=8G 
#SBATCH --ntasks=8 
#SBATCH -e PWS07_ngsLD_downsample_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

cp /home/jamcgirr/ph/data/angsd/SFS/downsample/glf/PWS07_minQ20_minMQ30.glf.gz /home/jamcgirr/ph/data/angsd/SFS/downsample/glf/pos/
gzip -d /home/jamcgirr/ph/data/angsd/SFS/downsample/glf/pos/PWS07_minQ20_minMQ30.glf.gz 
#gzip -d /home/jamcgirr/ph/data/angsd/SFS/downsample/glf/pos/PWS07_minQ20_minMQ30.glf.pos.gz 
#awk '{ print $1,$2 }' /home/jamcgirr/ph/data/angsd/SFS/downsample/glf/pos/PWS07_minQ20_minMQ30.glf.pos > /home/jamcgirr/ph/data/angsd/SFS/downsample/glf/pos/PWS07.pos.txt
/home/jamcgirr/apps/ngsLD/ngsLD --geno /home/jamcgirr/ph/data/angsd/SFS/downsample/glf/pos/PWS07_minQ20_minMQ30.glf --probs --log_scale --n_ind 41 --max_kb_dist 5 --n_sites 562485864 --n_threads 8 --pos /home/jamcgirr/ph/data/angsd/SFS/downsample/glf/pos/PWS07.pos.txt --out /home/jamcgirr/ph/data/angsd/ngsLD/downsample/PWS07_minQ20_minMQ30_ld.txt 


#run: sbatch script_PWS07_ngsLD_downsample.sh