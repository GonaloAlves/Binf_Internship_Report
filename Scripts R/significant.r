library(edgeR)


x <- read.delim("BC_PC.txt",row.names="Geneid")

group <- factor(c(1,1,1,2,2,2))

y <- DGEList(counts=x,group=group)
y <- calcNormFactors(y)
design <- model.matrix(~group)
y <- estimateDisp(y,design)
et <- exactTest(y)
topTags(et)

edgeR_results <- topTags(et, n=7000)
significant <- edgeR_results$table[(edgeR_results$table$logFC >= 1 |
edgeR_results$table$logFC <= -1) & (edgeR_results$table$logCPM >= 3) 
& (edgeR_results$table$FDR < 0.05),]

write.csv(edgeR_results, "edge R_BCvsPC.csv", quote = FALSE)
write.csv(significant, "edge R_BCvsPC_significant.csv", quote = FALSE)

summary(de <- decideTestsDGE(et, p=0.05, adjust="BH"))

detags <- rownames(et)[as.logical(de)]
plotMD(et, main = "PCvsPK", ylim = c(-10, 10), xlim = c(-4, 18), 
hl.cex = 0.3, hl.col = c("red","limegreen"), legend = "bottomright")
abline(h = c(-1, 1), lwd = 1.5, lty = 2, col = "navyblue")
abline(v = c(3), lwd = 1.5, lty = 2, col = "navyblue")
