featureCounts -g locus_tag -t gene -a GCF_000006765.1_ASM676v1_gene.gtf -o FeatureCounts_reads B1C.sam B1K.sam B1N.sam B1P.sam B1Z.sam B2C.sam B2K.sam B2N.sam B2P.sam B2Z.sam B3C.sam B3K.sam B3N.sam B3P.sam
B3Z.sam P1C.sam P1K.sam P1N.sam P1P.sam P1Z.sam P2C.sam P2K.sam P2N.sam P2P.sam P2Z.sam P3C.sam P3K.sam P3N.sam P3P.sam P3Z.sam


#Esta comando utiliza a ferramenta featureCounts para contar as sequências de RNA (reads) mapeadas em regiões específicas do genoma. 
#Recebe como entrada um conjunto de arquivos SAM que contêm as reads mapeadas em diferentes amostras experimentais.

#Os parâmetros utilizados no comando são os seguintes:

#-g locus_tag: especifica que o identificador do gene a ser usado na contagem: locus_tag.
#-t gene: indica que o tipo de recurso genómico a ser considerado: gene.
#-a GCF_000006765.1_ASM676v1_gene.gtf: fornece o arquivo de anotação genómica (no formato GTF) que contém informações sobre a estrutura dos genes e suas localizações no genoma de referência.
#-o FeatureCounts_reads: define o nome do arquivo de output que vai conter os resultados da contagem de reads.

#Os arquivos SAM listados após as opções são os arquivos de inputs.
