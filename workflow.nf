nextflow.enable.dsl=2

workflow PIPELINE {

    take:
    reads_ch

    main:
    trimmed_ch = CUTADAPT(reads_ch)

    FASTQC(trimmed_ch)

    ALIGNMENT(trimmed_ch, params.reference)

    emit:
    trimmed_ch
}
