process FASTQC {

    tag "$sample_id"

    publishDir "results/fastqc", mode: 'copy'

    input:
    tuple val(sample_id), path(reads)

    output:
    tuple path("*_fastqc.html"), path("*_fastqc.zip")

    script:
    """
    ${params.fastqc} ${reads}
    """
}