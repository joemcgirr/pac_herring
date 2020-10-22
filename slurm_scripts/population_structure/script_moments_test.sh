#!/bin/bash

#SBATCH --job-name=moments_test
#SBATCH --mem=8G 
#SBATCH --ntasks=4 
#SBATCH -e moments_test_%A_%a.err 
#SBATCH --time=1:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

#/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -bam p1.bams -doSaf 1 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -GL 1 -P 8 -out p1 -minMapQ 1 -minQ 20 
#/home/jamcgirr/apps/angsd_sep_20/angsd/angsd -bam p2.bams -doSaf 1 -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -GL 1 -P 8 -out p2 -minMapQ 1 -minQ 20                                                                                                                                                       
 
#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS p1.saf.idx p2.saf.idx -bootstrap 10 -P 4 -r chr1:1-100000 > p12_boots.sfs
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS p1.saf.idx  -P 4 -r chr1:1-100000 > p1.sfs
/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS p2.saf.idx  -P 4 -r chr1:1-100000 > p2.sfs

#split -l 1 -d --additional-suffix=.sfs p12_boots.sfs p12_

# mv p12_00.sfs p12_10.sfs
# mv p12_01.sfs p12_1.sfs
# mv p12_02.sfs p12_2.sfs
# mv p12_03.sfs p12_3.sfs
# mv p12_04.sfs p12_4.sfs
# mv p12_05.sfs p12_5.sfs
# mv p12_06.sfs p12_6.sfs
# mv p12_07.sfs p12_7.sfs
# mv p12_08.sfs p12_8.sfs
# mv p12_09.sfs p12_9.sfs

module load R
Rscript /home/jamcgirr/apps/moments/AFS-analysis-with-moments/modSel_write.R contrast=p12 args="p1 p2 16 16 0.02 0.005"
source /home/jamcgirr/apps/my_python3.7/bin/activate

sleep 1 && /home/jamcgirr/apps/moments/AFS-analysis-with-moments/multimodel_inference/py3/IM.py p12_1.sfs p1 p2 16 16 0.02 0.005 >>p12.modsel

#/home/jamcgirr/apps/angsd_sep_20/angsd/misc/realSFS dadi p1.saf.idx p2.saf.idx -sfs p1.sfs -sfs p2.sfs -r chr1:1-100000 -ref /home/jamcgirr/ph/data/c_harengus/c.harengus.fa -anc /home/jamcgirr/ph/data/c_harengus/c.harengus.fa > dadiout
#
#/home/jamcgirr/apps/moments/AFS-analysis-with-moments/multimodel_inference/realsfs2dadi.pl dadiout 10 10 > 2pops_dadi.data
#
#/home/jamcgirr/apps/moments/AFS-analysis-with-moments/multimodel_inference/py3/2dAFS.py 2pops_dadi.data p1 p2 16 16


# get Fst for 2d SFS and plot SFS

python
import moments
dd = moments.Misc.make_data_dict('2pops_dadi.data')
fs = moments.Spectrum.from_data_dict(dd,pop_ids=[ 'pop0' , 'pop1'],projections=[16 , 16],polarized = True)
S = fs.S()
Fst = fs.Fst()
moments.Plotting.plot_single_2d_sfs(fs, vmin =1)
import matplotlib
matplotlib.pyplot.savefig("my_plot") 


# get pi and tajD for 1d SFS

python
import moments
dd = moments.Misc.make_data_dict('2pops_dadi.data')
#fs = moments.Spectrum([88113,1222,132,445,285,176,41,20,73,276,192,68,50,23,3,2,47,50,0,0,362])
D = fs . Tajima_D ()
pi = fs.pi()

#command to run: sbatch script_moments_test.sh