

# Author: Naupaka Zimmerman June 16, 2014
# Script to make figure with ggplot from
# command line argument for SWC bootcamp
# UC Davis - Davis, CA
 
.libPaths("c/Program\ Files/R/R-3.1.0/bin/Rscript.exe ")
 
# Load libraries
require(ggplot2)
require(reshape2)
 
# Takes one command line argument as input data set
options <- commandArgs(trailingOnly = TRUE)
 
# load that csv from command line arg
data.in <- read.csv(options[1])
 
# melt with defaults 
data.in.melted <- melt(data.in)

# plot with ggplot
out.plot <- ggplot(data.in.melted,(aes(x=PatientID, y=value))) +
geom_point() +
stat_sum() +
theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
# save pdf based on input file name
savename <- paste0(options[1],".pdf")
ggsave(out.plot, file=savename, width = 12, height = 8)