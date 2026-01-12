process FASTQC {

    tag "$sample_id"

    publishDir "results/fastqc", mode: 'copy'

    input:
    tuple val(sample_id), path(reads)

    output:
    path "*_fastqc.*"

    script:
    """
    fastqc ${reads}
    """
}
