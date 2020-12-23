#!/bin/bash

#SBATCH --job-name=PWS07_ngsLD_downsample
#SBATCH --mem=60G 
#SBATCH --ntasks=8 
#SBATCH -e PWS07_ngsLD_downsample_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

#cp /home/jamcgirr/ph/data/angsd/SFS/downsample/glf/PWS07_minQ20_minMQ30.glf.gz /home/jamcgirr/ph/data/angsd/SFS/downsample/glf/pos/
#gzip -d /home/jamcgirr/ph/data/angsd/SFS/downsample/glf/pos/PWS07_minQ20_minMQ30.glf.gz 
#gzip -d /home/jamcgirr/ph/data/angsd/SFS/downsample/glf/pos/PWS07_minQ20_minMQ30.glf.pos.gz 
#awk '{ print $1,$2 }' /home/jamcgirr/ph/data/angsd/SFS/downsample/glf/pos/PWS07_minQ20_minMQ30.glf.pos > /home/jamcgirr/ph/data/angsd/SFS/downsample/glf/pos/PWS07.pos.txt
#/home/jamcgirr/apps/ngsLD/ngsLD --geno /home/jamcgirr/ph/data/angsd/SFS/downsample/glf/pos/PWS07_minQ20_minMQ30.glf --probs --log_scale --n_ind 41 --max_kb_dist 5 --n_sites 562485864 --rnd_sample 0.001 --n_threads 8 --pos /home/jamcgirr/ph/data/angsd/SFS/downsample/glf/pos/PWS07.pos.txt --out /home/jamcgirr/ph/data/angsd/ngsLD/downsample/PWS07_minQ20_minMQ30_ld.txt 

##### by chr
#/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -bam /home/jamcgirr/ph/data/angsd/SFS/downsample/downsample_bams_PWS07.txt -doGlf 2 -doMaf 3 -doMajorMinor 1 -doPost 1 -doCounts 1 -doGeno 2 -r chr1 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -ref /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -minMapQ 30 -minQ 20 -GL 1 -P 8 -uniqueOnly 1 -remove_bads 1 -only_proper_pairs 1 -trim 0 -C 50 -minInd 10 -setMinDepth 10 -setMaxDepth 100 -out /home/jamcgirr/ph/data/angsd/ngsLD/downsample/PWS07_chr1_minQ20_minMQ30 
#42 min

# geno file
#cp /home/jamcgirr/ph/data/angsd/ngsLD/downsample/PWS07_chr1_minQ20_minMQ30.geno.gz /home/jamcgirr/ph/data/angsd/ngsLD/downsample/unzipped/
#gzip -d /home/jamcgirr/ph/data/angsd/ngsLD/downsample/unzipped/PWS07_chr1_minQ20_minMQ30.geno.gz
#awk '{ print $1,$2 }' /home/jamcgirr/ph/data/angsd/ngsLD/downsample/unzipped/PWS07_chr1_minQ20_minMQ30.geno > /home/jamcgirr/ph/data/angsd/ngsLD/downsample/unzipped/PWS07_chr1.pos.txt
#sed 's/ /\t/g' /home/jamcgirr/ph/data/angsd/ngsLD/downsample/unzipped/PWS07_chr1.pos.txt > /home/jamcgirr/ph/data/angsd/ngsLD/downsample/unzipped/PWS07_chr1_tab.pos.txt
# 1 min

#/home/jamcgirr/apps/ngsLD/ngsLD --geno /home/jamcgirr/ph/data/angsd/ngsLD/downsample/PWS07_chr1_minQ20_minMQ30.geno.gz --n_ind 41 --max_kb_dist 5 --n_sites 26520291 --rnd_sample 0.01 --n_threads 8 --pos /home/jamcgirr/ph/data/angsd/ngsLD/downsample/unzipped/PWS07_chr1_tab.pos.txt --out /home/jamcgirr/ph/data/angsd/ngsLD/downsample/PWS07_chr1_minQ20_minMQ30_ld.txt 
#this worked! no need for beagle output

perl /home/jamcgirr/apps/ngsLD/scripts/prune_graph.pl --in_file /home/jamcgirr/ph/data/angsd/ngsLD/downsample/PWS07_chr1_minQ20_minMQ30_ld.txt --max_kb_dist 5 --min_weight 0.5 --out /home/jamcgirr/ph/data/angsd/ngsLD/downsample/PWS07_chr1_minQ20_minMQ30_unlinked.txt


# beagle file
#cp /home/jamcgirr/ph/data/angsd/ngsLD/downsample/PWS07_chr1_minQ20_minMQ30.beagle.gz /home/jamcgirr/ph/data/angsd/ngsLD/downsample/unzipped/
#gzip -d /home/jamcgirr/ph/data/angsd/ngsLD/downsample/unzipped/PWS07_chr1_minQ20_minMQ30.beagle.gz
# 4 min


#/home/jamcgirr/apps/ngsLD/ngsLD --geno /home/jamcgirr/ph/data/angsd/ngsLD/downsample/PWS07_chr1_minQ20_minMQ30.geno.gz --probs --n_ind 41 --max_kb_dist 5 --n_sites 26520291 --rnd_sample 0.01 --n_threads 8 --pos /home/jamcgirr/ph/data/angsd/ngsLD/downsample/unzipped/PWS07_chr1.pos.txt --out /home/jamcgirr/ph/data/angsd/ngsLD/downsample/PWS07_chr1_minQ20_minMQ30_ld.txt 


#run: sbatch script_PWS07_ngsLD_downsample.sh