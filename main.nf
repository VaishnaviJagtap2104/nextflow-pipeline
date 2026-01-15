nextflow.enable.dsl=2

include { PIPELINE }  from './workflow.nf'

workflow {

    Channel
        .fromPath('data/*.fastq.gz')
        .map { file -> tuple(file.baseName, file) }
        .set { reads_ch }

    PIPELINE(reads_ch)
}

