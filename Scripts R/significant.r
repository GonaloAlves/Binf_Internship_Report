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


#Decomentação:
#No início do script, é feita a leitura de um ficheiro de entrada no formato tabular, onde
#cada coluna representa um experimento específico, por exemplo, B1C, B2C, B3C,
#P1C, P2C, P3C, e cada linha representa um gene identificado pelo seu Geneid
#(Logus_Tag), por exemplo, PA0001, PA0002, PA0003. Os números presentes em
#cada coluna são os "feature counts", que representam a contagem de expressão do
#gene correspondente em cada condição experimental.
#A partir dos dados lidos, é construído um objeto DGEList, que armazena as contagens
#de expressão e as informações de grupo de cada amostra. 
#Em seguida, são realizadas etapas de normalização, estimativas da dispersão e um teste de hipótese utilizando o modelo estatístico fornecido pela biblioteca edgeR.
#O resultado do teste de hipótese é obtido através da função topTags, que retorna os principais genes diferencialmente expressos. 
#Os genes significativos são selecionados com base em critérios como logFC (log-fold change),
#logCPM (log-counts per million) e FDR (false discovery rate), tais dados formam retirados do ficheiro de FeatureCounts Reads.
#Além disso, o script inclui uma parte onde gera gráficos de visualização dos resultados, 
#que mostra a diferença de expressão entre as condições e destaca os genes em que as diferenças de expressão são significativas, classificados como UpRegulated, DownRegulated e NotSignificaticant.
#O script, também permite guardar todas os resultados gerados  num ficheiro .CSV para estudos futuros.

