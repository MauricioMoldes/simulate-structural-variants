if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("RSVSim")


# simulated read data
sessionInfo()
BiocManager::install("RSVSim", force = TRUE )
# required libraries 
#BiocManager::install(c("boot","class", "cluster", "codetools", "foreign", "KernSmooth", "lattice", "MASS", "Matrix", "mgcv","nnet", "spatial","survival"))
# re-use UCSC genome sequences. Could point to load a sequence file also 
#BiocManager::install("BSgenome.Hsapiens.UCSC.hg19")

getwd()

# loads library 
library(RSVSim)
# loads genome sequences from UCSC
library(BSgenome.Hsapiens.UCSC.hg19)

genome = DNAStringSet(Hsapiens[["chr21"]]) # 
names(genome) = "chr21" # adds the name of the chr subset -  required 

#simulate deletions
sim = simulateSV(output="del", genome=genome, dels=10, sizeDels =c(50,100,1000,250,500,750,2000,3000,4000,5000),
                 bpSeqSize=6, seed=456, verbose=FALSE)

sim
metadata(sim)


###################################################
### code chunk number 7: insertionExample
###################################################
sim = simulateSV(output="ins", genome=genome, ins=10, sizeIns=c(50,100,1000,250,500,750,2000,3000,4000,5000), percCopiedIns=0.66, 
                 bpSeqSize=6, seed=246, verbose=FALSE)
sim
metadata(sim)


###################################################
### code chunk number 8: inversionExample
###################################################
sim = simulateSV(output="inv", genome=genome, invs=10, sizeInvs=c(50,100,1000,250,500,750,2000,3000,4000,5000),
                 bpSeqSize=6, seed=456, verbose=FALSE)
sim
metadata(sim)


###################################################
### code chunk number 9: tandemDupExample
###################################################
sim = simulateSV(output="dup", genome=genome, dups=10, sizeDups=c(50,100,1000,250,500,750,2000,3000,4000,5000), maxDups=10,
                 bpSeqSize=6, seed=3456, verbose=FALSE)
sim
metadata(sim)


###################################################
### code chunk number 10: translocationExample1
###################################################
sim = simulateSV(output="bnd", genome=genome,trans=10, bpSeqSize=6, seed=123, verbose=FALSE)
sim
metadata(sim)


