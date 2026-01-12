nextflow.enable.dsl=2

include { FASTQC } from './modules/fastqc.nf'
include { CUTADAPT } from './modules/cutadapt.nf'

workflow {

    /*
     * Create channel from FASTQ files
     */
    Channel
        .fromPath("data/*.fastq*")
        .map { file -> tuple(file.baseName, file) }
        .set { fastq_ch }

    /*
     * Step 1: Trimming
     */
    trimmed_ch = CUTADAPT(fastq_ch)

    /*
     * Step 2: FastQC on trimmed reads
     */
    FASTQC(trimmed_ch)
}


