#!/bin/bash

#SBATCH --job-name=SS96_angsd_downsample_thetas
#SBATCH --mem=30G 
#SBATCH --ntasks=8 
#SBATCH -e SS96_angsd_downsample_thetas_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS saf2theta /home/jamcgirr/ph/data/angsd/SFS/downsample/saf/SS96_minQ20_minMQ30.saf.idx -outname /home/jamcgirr/ph/data/angsd/SFS/downsample/thetas/folded/SS96_minQ20_minMQ30 -fold 1 -sfs /home/jamcgirr/ph/data/angsd/SFS/downsample/sfs/folded/SS96_minQ20_minMQ30_folded.sfs 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat /home/jamcgirr/ph/data/angsd/SFS/downsample/thetas/folded/SS96_minQ20_minMQ30.thetas.idx 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat /home/jamcgirr/ph/data/angsd/SFS/downsample/thetas/folded/SS96_minQ20_minMQ30.thetas.idx -win 50000 -step 10000 -outnames /home/jamcgirr/ph/data/angsd/SFS/downsample/thetas/folded/SS96_minQ20_minMQ30_50kb_win_10kb_step 

/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS saf2theta /home/jamcgirr/ph/data/angsd/SFS/downsample/saf/SS96_minQ20_minMQ30.saf.idx -outname /home/jamcgirr/ph/data/angsd/SFS/downsample/thetas/unfolded/SS96_minQ20_minMQ30 -sfs /home/jamcgirr/ph/data/angsd/SFS/downsample/sfs/folded/SS96_minQ20_minMQ30_folded.sfs 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat /home/jamcgirr/ph/data/angsd/SFS/downsample/thetas/unfolded/SS96_minQ20_minMQ30.thetas.idx 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat /home/jamcgirr/ph/data/angsd/SFS/downsample/thetas/unfolded/SS96_minQ20_minMQ30.thetas.idx -win 50000 -step 10000 -outnames /home/jamcgirr/ph/data/angsd/SFS/downsample/thetas/unfolded/SS96_minQ20_minMQ30_50kb_win_10kb_step 


#run: sbatch script_SS96_angsd_downsample_thetas.sh