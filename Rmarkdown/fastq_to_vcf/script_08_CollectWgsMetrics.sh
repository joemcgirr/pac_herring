#!/bin/bash

#SBATCH --job-name=08_CollectWgsMetrics
#SBATCH --mem=8G 
#SBATCH --ntasks=1 
#SBATCH -e 08_CollectWgsMetrics_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

module load picardtools
for file in /home/eoziolor/phpopg/data/align/08*.bam
do
filename=$(basename $file .bam)
picard-tools CollectWgsMetrics I=$file R=/home/jamcgirr/ph/data/c_harengus/c.harengus.fa O=/home/jamcgirr/ph/familiarize/elias_qc_stats/wgsMetrics/$filename.collect_wgs_metrics.txt
done


#command to run: sbatch script_08_CollectWgsMetrics.sh