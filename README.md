


# Pacific herring population genomics

This repo contains resources to study population genetic change through space and time in Pacific herring. The causes of the collapse of the Prince William Sound (PWS) Pacific herring stock are controversial, and the reasons for the lack of recovery remain a mystery. We hypothesize that interactions between the 1989 Exxon Valdez oil spill and a subsequent viral epidemic were influential. We have collected whole genome sequences from ~1,300 individual fish from across Alaska and across time (four times spanning three decades), and throughout the rest of their range, to explore genomic change associated with the collapse and the period since; with these data we seek to explore and test hypotheses about the causes and consequences of the collapse, and test hypotheses about the genetic basis of parallel local adaptation.

## Rmarkdown

Running these notebooks will:

- Generate SLURM submission bash scripts to run bioinformatics software on the FARM cluster. They use the R package reticulate with python to automate the tedious process of writing bash scripts for each job run on the computing cluster. These scripts were made to run on the Farm cluster which uses SLURM scheduling. Each bash script has a SLURM header.
- Process the output from jobs run on the cluster.
- Perform a variety of genomic analyses.
- Plot results.

## lab_meetings

Slides and other materials documenting progress on the project.

## slurm_scripts

The same SLRUM bash scripts but generated by Jupyter notebooks.

<img src="https://github.com/joemcgirr/pac_herring/blob/master/ph_map-01.png?raw=true" alt="drawing" width="800"/>


