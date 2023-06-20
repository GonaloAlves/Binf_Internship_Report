#!/bin/bash

for i in /media/vaniapobre/Elements_2/RNA-Seq_May2023/Bowtie2/*_R1_trimmed.fast.gz; do
	sample=$(basename $i "_R1_trimmed.fastq") 
	(bowtie2 -x aeruginosa_Ind -1 ${sample}_R1_trimmed.fastq.gz -2 ${sample}_R2_trimmed.fastq.gz --un ${sample}_UN -S ${sample}.sam) 2>${sample}.log
done
