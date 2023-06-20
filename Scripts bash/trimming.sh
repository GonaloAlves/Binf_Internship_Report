#!/bin/bash

for i in $(ls/media/vaniapobre/Elements_SE/RNA-Seq_May2023/Raw_Data/ aeruginosa/*.fastq.gz)
do 
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -a AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -u 10 -o ${i}\_trimmed.fastq.gz ${i} 
done


# Opção "-a": especifica a sequência do adaptador a ser removido. Neste caso, são fornecidas duas sequências de adaptadores: 
#1. "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA".
#2. "AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT".
#• Opção "-u": indica o número de bases a serem removidas do início das sequências. Neste caso, são removidos os primeiros 10 nucleótidos.
#• Opção "-o": define o nome do ficheiro de saída, com o sufixo "_trimmed.fastq.gz". 
#O comando "${i}" representa o nome do ficheiro de input atual dentro do ciclo, enquanto "${i}_trimmed.fastq.gz" representa o nome do ficheiro de output.


