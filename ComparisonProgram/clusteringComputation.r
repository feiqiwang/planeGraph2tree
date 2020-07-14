#!/usr/lib/R/library/Rscript

TreeEditDistanceResult <- as.dist(read.csv(file = "treeEditDistanceResult.CSV",header = TRUE, row.name = 1))
clusterResult <- hclust(TreeEditDistanceResult, "ward.D2")
plot(clusterResult,hang = -1,main = "",sub="",xlab="",ylab="",axes=FALSE)
