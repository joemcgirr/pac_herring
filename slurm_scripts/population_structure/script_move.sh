#!/bin/bash

#SBATCH --job-name=move
#SBATCH --mem=8G 
#SBATCH --ntasks=1 
#SBATCH -e move_%A_%a.err 
#SBATCH --time=1:00:00 
#SBATCH --mail-user=jamcgirr@ucdavis.edu ##email you when job starts,ends,etc
#SBATCH --mail-type=ALL
#SBATCH -p high 

mv *.err scripts/
mv slurm* scripts/
mv SS96_minQ20_minMQ30_unfolded.sfs sfs/unfolded/chunks/
mv SS96_minQ20_minMQ30_folded.sfs sfs/folded/chunks/
mv SS96_minQ20_minMQ30.arg saf/
mv SS96_minQ20_minMQ30.saf.idx saf/
mv SS96_minQ20_minMQ30.saf.pos.gz saf/
mv SS96_minQ20_minMQ30.saf.gz saf/
mv SS96_minQ20_minMQ30.mafs.gz maf/
mv SS96_minQ20_minMQ30.glf.pos.gz glf/
mv SS96_minQ20_minMQ30.glf.gz glf/


mv TB06_minQ20_minMQ30_unfolded.sfs sfs/unfolded/chunks/
mv TB06_minQ20_minMQ30_folded.sfs sfs/folded/chunks/
mv TB06_minQ20_minMQ30.arg saf/
mv TB06_minQ20_minMQ30.saf.idx saf/
mv TB06_minQ20_minMQ30.saf.pos.gz saf/
mv TB06_minQ20_minMQ30.saf.gz saf/
mv TB06_minQ20_minMQ30.mafs.gz maf/
mv TB06_minQ20_minMQ30.glf.pos.gz glf/
mv TB06_minQ20_minMQ30.glf.gz glf/

mv TB17_minQ20_minMQ30_unfolded.sfs sfs/unfolded/chunks/
mv TB17_minQ20_minMQ30_folded.sfs sfs/folded/chunks/
mv TB17_minQ20_minMQ30.arg saf/
mv TB17_minQ20_minMQ30.saf.idx saf/
mv TB17_minQ20_minMQ30.saf.pos.gz saf/
mv TB17_minQ20_minMQ30.saf.gz saf/
mv TB17_minQ20_minMQ30.mafs.gz maf/
mv TB17_minQ20_minMQ30.glf.pos.gz glf/
mv TB17_minQ20_minMQ30.glf.gz glf/

mv TB91_minQ20_minMQ30_unfolded.sfs sfs/unfolded/chunks/
mv TB91_minQ20_minMQ30_folded.sfs sfs/folded/chunks/
mv TB91_minQ20_minMQ30.arg saf/
mv TB91_minQ20_minMQ30.saf.idx saf/
mv TB91_minQ20_minMQ30.saf.pos.gz saf/
mv TB91_minQ20_minMQ30.saf.gz saf/
mv TB91_minQ20_minMQ30.mafs.gz maf/
mv TB91_minQ20_minMQ30.glf.pos.gz glf/
mv TB91_minQ20_minMQ30.glf.gz glf/

mv TB96_minQ20_minMQ30_unfolded.sfs sfs/unfolded/chunks/
mv TB96_minQ20_minMQ30_folded.sfs sfs/folded/chunks/
mv TB96_minQ20_minMQ30.arg saf/
mv TB96_minQ20_minMQ30.saf.idx saf/
mv TB96_minQ20_minMQ30.saf.pos.gz saf/
mv TB96_minQ20_minMQ30.saf.gz saf/
mv TB96_minQ20_minMQ30.mafs.gz maf/
mv TB96_minQ20_minMQ30.glf.pos.gz glf/
mv TB96_minQ20_minMQ30.glf.gz glf/

mv WA17_minQ20_minMQ30_unfolded.sfs sfs/unfolded/chunks/
mv WA17_minQ20_minMQ30_folded.sfs sfs/folded/chunks/
mv WA17_minQ20_minMQ30.arg saf/
mv WA17_minQ20_minMQ30.saf.idx saf/
mv WA17_minQ20_minMQ30.saf.pos.gz saf/
mv WA17_minQ20_minMQ30.saf.gz saf/
mv WA17_minQ20_minMQ30.mafs.gz maf/
mv WA17_minQ20_minMQ30.glf.pos.gz glf/
mv WA17_minQ20_minMQ30.glf.gz glf/

#run: sbatch script_move.sh