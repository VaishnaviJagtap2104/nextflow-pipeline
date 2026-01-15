nextflow.enable.dsl=2

include { CUTADAPT }  from './modules/cutadapt.nf'
include { FASTQC }    from './modules/fastqc.nf'
include { ALIGNMENT } from './modules/alignment.nf'
include { PIPELINE }  from './workflow.nf'

workflow {

    Channel
        .fromPath('data/*.fastq.gz')
        .map { file -> tuple(file.baseName, file) }
        .set { reads_ch }

    PIPELINE(reads_ch)
}

