# Nextflow Automated Variant Calling Pipeline

This repository contains an automated bioinformatics pipeline built using **Nextflow DSL2** for processing sequencing data and performing **variant calling**.

The pipeline performs the following steps:

1. Quality trimming using Cutadapt
2. Quality check using FastQC
3. Read alignment using BWA
4. BAM sorting using Samtools
5. Variant calling using BCFtools
