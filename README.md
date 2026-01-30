# Nextflow Automated Variant Calling Pipeline

This repository contains an automated bioinformatics pipeline built using **Nextflow DSL2** for processing sequencing data and performing **variant calling**.
The pipeline integrates multiple analysis stages including quality assessment, adapter and quality trimming, alignment against a genome, sorting and indexing of alignment files, and downstream variant detection. Each step is modularized to ensure clarity, reusability, and ease of maintenance.
The pipeline performs the following steps:

1. Quality trimming using **Cutadapt**
2. Quality check using **FastQC**
3. Read alignment using **BWA**
4. BAM sorting using **Samtools**
5. Variant calling using **BCFTools**

The workflow is designed with reproducibility and scalability in mind, allowing users to execute the pipeline consistently across different computing environments such as local machines, WSL, and high-performance computing (HPC) clusters. By leveraging Nextflow’s workflow management capabilities, the pipeline efficiently handles large datasets, manages dependencies, and supports parallel execution of tasks.

The modular design of the pipeline enables easy customization and extension, allowing additional steps such as quality control reporting, variant annotation, or filtering to be incorporated as needed. This makes the workflow suitable both for learning purposes and for real-world bioinformatics analyses.

