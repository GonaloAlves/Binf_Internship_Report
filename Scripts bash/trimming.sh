#!/bin/bash

for i in $(ls/media/vaniapobre/Elements_SE/RNA-Seq_May2023/Raw_Data/ aeruginosa/*.fastq.gz)
do 
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -a AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -u 10 -o ${i}\_trimmed.fastq.gz ${i} 
done
