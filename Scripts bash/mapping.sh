#!/bin/bash

for i in /media/vaniapobre/Elements_2/RNA-Seq_May2023/Bowtie2/*_R1_trimmed.fast.gz; do
	sample=$(basename $i "_R1_trimmed.fastq") 
	(bowtie2 -x aeruginosa_Ind -1 ${sample}_R1_trimmed.fastq.gz -2 ${sample}_R2_trimmed.fastq.gz --un ${sample}_UN -S ${sample}.sam) 2>${sample}.log
done

#1. Percorre as amostras de sequências de leituras terminam em *_R1_trimmed.fastq.gz
#2. Para cada amostra, é atribuído um nome utilizando a variável ‘sample’, que corresponde ao nome da amostra atual que está a ser processada.
#3. O comando do Bowtie2 é então executado com os seguintes parâmetros:
#   • ‘-x aeruginosa_Ind’: indica o genoma de referência previamente indexado pelo Bowtie2.
#   •	‘-1 ${sample}_R1_trimmed.fastq.gz': especifica o arquivo de input contendo as reads forward da amostra atual.
#   •	‘-2 ${sample}_R2_trimmed.fastq.gz’: especifica o arquivo de input contendo as reads reverse da amostra atual.
#   •	‘--un ${sample}_UN’: define o nome do arquivo de output que irá conter todas as reads que não foram mapeadas durante o processo de alinhamento.
#   •	‘-S ${sample}.sam’: indica o nome do arquivo de output que irá conter as reads mapeadas em formato SAM.
#   •	‘2>${sample}.log’: redireciona a saída de erro (stderr) para um arquivo de log específico para cada amostra, onde serão registadas informações relevantes, como a percentagem de reads que foram mapeadas.
#4. O processo é repetido para cada amostra encontrada no diretório.

