# create empty data frame with headers to record stats from each permutation
############################################################################
# wk_dir <- "C:/Users/jmcgirr/Documents/Whitehead_Lab/ph/freqs/perms/"
# pop_pairs <- c("PWS91_PWS96","PWS96_PWS07","PWS07_PWS17","TB91_TB96","TB96_TB06","TB06_TB17","SS96_SS06","SS06_SS17")
# header <- c("genome_mean_of_means","sd","min","max","q_99","q_95","q_90","q_10","q_5","q_1")
# 
# for (pop_pair in pop_pairs){
#   
# write.table(t(header), paste(wk_dir,pop_pair,'_perms.txt', sep = ""), row.names = FALSE, quote = FALSE, sep = '\t', col.names = FALSE)
#   
# }



# read in permuted allele frequencies and get sliding window means
##################################################################

packages<-function(x){
  x<-as.character(match.call()[[2]])
  if (!require(x,character.only=TRUE)){
    install.packages(pkgs=x,repos="http://cran.r-project.org")
    require(x,character.only=TRUE)
  }
}

if (!require("windowscanr",character.only=TRUE)){
  install_github('tavareshugo/windowscanr')
}
packages(optparse)
packages(devtools)
library(windowscanr)
#suppressPackageStartupMessages(library(optparse))

option_list <- list (
  
  make_option (c("-a","--pop0"),
               default="PWS91",
               help="The name of populations in permutation [default %default]"),
  make_option (c("-b","--pop1"),
               default="PWS96",
               help="The name of populations in permutation [default %default]")
  
)

opt  <- parse_args(
  OptionParser(#usage= "usage: %prog [options]",
    option_list=option_list)
)





wk_dir <- paste("/home/jamcgirr/ph/data/freqs/perms/",opt$pop0,"_",opt$pop1,"/", sep = "")

t0 <- read.table(paste(wk_dir,'shufpop_',opt$pop0,'_freqs.txt', sep = ""), header = FALSE, stringsAsFactors = FALSE, col.names = c("chr","pos","t0_AF"))
t1 <- read.table(paste(wk_dir,'shufpop_',opt$pop1,'_freqs.txt', sep = ""), header = FALSE, stringsAsFactors = FALSE, col.names = c("chr","pos","t1_AF"))


freqs <- data.frame(chr = t0$chr,
                    pos = t0$pos,
                    t0_AF = t0$t0_AF,
                    t1_AF = t1$t1_AF)

freqs$t0_transformed_freq <- asin(sqrt(freqs$t0_AF))
freqs$t1_transformed_freq <- asin(sqrt(freqs$t1_AF))

freqs$zt01 <- freqs$t1_transformed_freq - freqs$t0_transformed_freq
options(warn=-1)
freqs_win <- winScan(x = freqs, 
                     groups = "chr", 
                     position = "pos", 
                     values = c("zt01"), 
                     win_size = 50000,
                     win_step = 10000,
                     funs = c("mean"))
freqs_win <- na.omit(freqs_win)
options(warn=0)

header <- c("genome_mean_of_means","sd","min","max","q_99","q_95","q_90","q_10","q_5","q_1")
perm_stats <- t(c(mean(freqs_win$zt01_mean), sd(freqs_win$zt01_mean),
               as.vector(quantile(freqs_win$zt01_mean,0)),
               as.vector(quantile(freqs_win$zt01_mean,1)),
               as.vector(quantile(freqs_win$zt01_mean,0.99)),
               as.vector(quantile(freqs_win$zt01_mean,0.95)),
               as.vector(quantile(freqs_win$zt01_mean,0.90)),
               as.vector(quantile(freqs_win$zt01_mean,0.10)),
               as.vector(quantile(freqs_win$zt01_mean,0.5)),
               as.vector(quantile(freqs_win$zt01_mean,0.1))))
colnames(perm_stats) <- header
perm_stats <- round(perm_stats,5)

wk_dir <- "/home/jamcgirr/ph/data/freqs/perms/"
previous_outfile <- read.table(paste(wk_dir,opt$pop0,'_',opt$pop1,'_perms.txt', sep = ""), header = TRUE, stringsAsFactors = FALSE)
new_outfile <- rbind(previous_outfile,perm_stats)

write.table(new_outfile, paste(wk_dir,opt$pop0,'_',opt$pop1,'_perms.txt', sep = ""), row.names = FALSE, quote = FALSE, sep = '\t')

