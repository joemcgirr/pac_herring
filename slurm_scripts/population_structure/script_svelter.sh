#!/bin/bash

#SBATCH --job-name=svelter
#SBATCH --mem=8G 
#SBATCH --ntasks=8 
#SBATCH -e svelter_%A_%a.err 
#SBATCH --time=24:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

cd /home/jamcgirr/apps/svelter/
python setup.py install --user
export PATH=$PATH:$HOME/.local/bin
cd /home/jamcgirr/ph/data/svelter
# /home/jamcgirr/apps/svelter/svelter_sv/svelter.py Setup --reference /home/jamcgirr/ph/data/c_harengus/c.harengus.fa --workdir /home/jamcgirr/ph/data/svelter

# /home/jamcgirr/apps/svelter/svelter_sv/svelter.py --sample /home/eoziolor/phpopg/data/align/0457_SS17.bam --workdir /home/jamcgirr/ph/data/svelter


/home/jamcgirr/apps/svelter/svelter_sv/svelter.py NullModel --sample /home/eoziolor/phpopg/data/align/0457_SS17.bam --workdir /home/jamcgirr/ph/data/svelter
/home/jamcgirr/apps/svelter/svelter_sv/svelter.py BPSearch --sample /home/eoziolor/phpopg/data/align/0457_SS17.bam --workdir /home/jamcgirr/ph/data/svelter
/home/jamcgirr/apps/svelter/svelter_sv/svelter.py BPIntegrate --sample /home/eoziolor/phpopg/data/align/0457_SS17.bam --workdir /home/jamcgirr/ph/data/svelter

#command to run: sbatch script_svelter.sh