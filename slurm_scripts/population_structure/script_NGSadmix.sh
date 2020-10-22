#!/bin/bash

#SBATCH --job-name=NGSadmix
#SBATCH --mem=16G 
#SBATCH --ntasks=4 
#SBATCH -e NGSadmix_%A_%a.err 
#SBATCH --time=72:00:00  
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

#git clone https://github.com/Rosemeis/pcangsd.git
#cd pcangsd/
#python setup.py build_ext --inplace

module load angsd 
#NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.BEAGLE.PL.gz -K 2 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k2_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5 -P 4 
#NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.BEAGLE.PL.gz -K 3 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k3_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5 -P 4 
#NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.BEAGLE.PL.gz -K 4 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k4_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5 -P 4 
#NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.BEAGLE.PL.gz -K 5 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k5_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5 -P 4
#NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.BEAGLE.PL.gz -K 6 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k6_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5 -P 4
#NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.BEAGLE.PL.gz -K 7 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k7_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5 -P 4
#NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.BEAGLE.PL.gz -K 8 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k8_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5 -P 4
#NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.BEAGLE.PL.gz -K 9 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k9_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5 -P 4
#NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.BEAGLE.PL.gz -K 10 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k10_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5 -P 4
#NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.BEAGLE.PL.gz -K 11 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k11_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5 -P 4
#NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.BEAGLE.PL.gz -K 12 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k12_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5 -P 4
#NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.BEAGLE.PL.gz -K 13 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k13_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5 -P 4
#NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.BEAGLE.PL.gz -K 14 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k14_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5 -P 4
#NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.BEAGLE.PL.gz -K 15 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k15_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5 -P 4
#NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.BEAGLE.PL.gz -K 16 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k16_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5 -P 4
#NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.BEAGLE.PL.gz -K 17 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k17_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5 -P 4
NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.BEAGLE.PL.gz -K 18 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k18_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5 -P 4
NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.BEAGLE.PL.gz -K 19 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k19_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5 -P 4
NGSadmix -likes /home/jamcgirr/ph/data/vcfs/chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5.BEAGLE.PL.gz -K 20 -o /home/jamcgirr/ph/data/angsd/NGSadmix/k20_chr1_ph_filtered_snps_minDP600_maxDP2000_maf0.05_minQ20_maxmiss0.5 -P 4


#command to run: sbatch script_NGSadmix.sh