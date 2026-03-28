# Nextflow Automated Variant Calling Pipeline

This repository contains an automated bioinformatics pipeline built using **Nextflow DSL2** for processing sequencing data and performing **variant calling**.
The pipeline integrates multiple analysis stages including quality assessment, adapter and quality trimming, alignment against a genome, sorting and indexing of alignment files, and downstream variant detection. Each step is modularized to ensure clarity, reusability, and ease of maintenance.
The pipeline performs the following steps:

1. Quality trimming using **Cutadapt**
   ---
   Trims adapter sequences and low-quality bases from raw reads. Adapters are
artificial sequences added during library preparation and must be removed
before alignment. Reads shorter than 30bp after trimming are discarded.
---
2. Quality check using **FastQC**
   ---
   Generates a quality control report for each sample after trimming. The HTML
report shows per-base quality scores, GC content, duplication levels, and
adapter contamination — confirming that trimming worked correctly.
---
3. Read alignment using **BWA**
   ---
   Indexes the reference genome before alignment. This creates binary index
files (.amb, .ann, .bwt, .pac, .sa) that allow BWA to rapidly search the
genome during alignment. Runs once and is shared across all samples.
---
4. BWA mem (ALignment) and Samtools sort + index
   ---
   Aligns trimmed reads to the reference genome. BWA-MEM is optimised for
reads of 70bp and longer. The output is piped directly to Samtools to
convert from SAM (text) to the smaller BAM (binary) format.
---
5. Variant calling using **BCFTools** 
   ---
  Detects SNPs and indels from the sorted BAM file. BCFtools mpileup computes
genotype likelihoods at each position, and BCFtools call identifies variant
sites. Output is compressed and indexed with tabix for fast region queries.
---

  
The workflow is designed with reproducibility and scalability in mind, allowing users to execute the pipeline consistently across different computing environments such as local machines, WSL, and high-performance computing (HPC) clusters. By leveraging Nextflow’s workflow management capabilities, the pipeline efficiently handles large datasets, manages dependencies, and supports parallel execution of tasks.

The modular design of the pipeline enables easy customization and extension, allowing additional steps such as quality control reporting, variant annotation, or filtering to be incorporated as needed. This makes the workflow suitable both for learning purposes and for real-world bioinformatics analyses.

## Project Structure
```
nextflow-pipeline/
├── main.nf                  # Entry point
├── nextflow.config          # Parameters and tool paths
├── workflows/
│   └── workflow.nf          # Pipeline workflow definition
├── modules/
│   ├── bwa_index.nf
│   ├── cutadapt.nf
│   ├── fastqc.nf
│   ├── alignment.nf
│   └── variant_calling.nf
├── data/                    # Input FASTQ files
├── reference/               # Reference genome
└── results/                 # Pipeline outputs (auto-created)
    ├── trimmed/
    ├── fastqc/
    ├── bam/
    └── vcf/
```


## Clone the Repository
```bash
git clone https://github.com/Vaishnavijagtap2104/nextflow-pipeline.git
cd nextflow-pipeline
```

## Environment Setup
```bash
conda activate bnf
```

## Run the Pipeline
```bash
nextflow run main.nf
```

## Requirements
- Nextflow  
- Conda (Miniconda) 
- Required bioinformatics tools
- Fastqc
- Cutadapt
- BCFtools
- BWA
- Samtools
