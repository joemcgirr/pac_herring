#!/bin/bash

#SBATCH --job-name=WA17_thetas
#SBATCH --mem=16G 
#SBATCH --ntasks=8 
#SBATCH -e WA17_thetas_%A_%a.err 
#SBATCH --time=120:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -bam /home/jamcgirr/ph/data/angsd/SFS/thetas/WA17_bams_p_1_5_rm.txt -doSaf 1 -doMajorMinor 1 -doMaf 3 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -minMapQ 30 -minQ 20 -GL 1 -P 8 -out /home/jamcgirr/ph/data/angsd/SFS/thetas/population_WA17_minQ20_minMQ30 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/thetas/population_WA17_minQ20_minMQ30.saf.idx -P 8 -nSites 100000 > /home/jamcgirr/ph/data/angsd/SFS/thetas/unfolded/population_WA17_minQ20_minMQ30_unfolded.sfs 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS saf2theta /home/jamcgirr/ph/data/angsd/SFS/thetas/population_WA17_minQ20_minMQ30.saf.idx -outname /home/jamcgirr/ph/data/angsd/SFS/thetas/unfolded/population_WA17_minQ20_minMQ30 -sfs /home/jamcgirr/ph/data/angsd/SFS/thetas/unfolded/population_WA17_minQ20_minMQ30_unfolded.sfs 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat /home/jamcgirr/ph/data/angsd/SFS/thetas/unfolded/population_WA17_minQ20_minMQ30.thetas.idx 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat /home/jamcgirr/ph/data/angsd/SFS/thetas/unfolded/population_WA17_minQ20_minMQ30.thetas.idx -win 50000 -step 10000 -outnames /home/jamcgirr/ph/data/angsd/SFS/thetas/unfolded/population_WA17_minQ20_minMQ30_50kb_win_10kb_step 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS /home/jamcgirr/ph/data/angsd/SFS/thetas/population_WA17_minQ20_minMQ30.saf.idx -P 8 -nSites 100000 -fold 1 > /home/jamcgirr/ph/data/angsd/SFS/thetas/folded/population_WA17_minQ20_minMQ30_folded.sfs 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS saf2theta /home/jamcgirr/ph/data/angsd/SFS/thetas/population_WA17_minQ20_minMQ30.saf.idx -outname /home/jamcgirr/ph/data/angsd/SFS/thetas/unfolded/population_WA17_minQ20_minMQ30 -fold 1 -sfs /home/jamcgirr/ph/data/angsd/SFS/thetas/folded/population_WA17_minQ20_minMQ30_folded.sfs 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat /home/jamcgirr/ph/data/angsd/SFS/thetas/folded/population_WA17_minQ20_minMQ30.thetas.idx 
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/thetaStat do_stat /home/jamcgirr/ph/data/angsd/SFS/thetas/folded/population_WA17_minQ20_minMQ30.thetas.idx -win 50000 -step 10000 -outnames /home/jamcgirr/ph/data/angsd/SFS/thetas/folded/population_WA17_minQ20_minMQ30_50kb_win_10kb_step 
rm /home/jamcgirr/ph/data/angsd/SFS/thetas/population_WA17_minQ20_minMQ30.saf.gz

#command to run: sbatch script_WA17_thetas.sh