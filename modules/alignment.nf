process ALIGNMENT {
    tag "$sample_id"

    input:
        tuple val(sample_id), path(reads)
        tuple path(reference), path(indexes)

    output:
        tuple val(sample_id), path("${sample_id}.bam")

    script:
    """
    ${params.bwa} mem -t 4 ${reference} ${reads} |
    ${params.samtools} view -Sb - > ${sample_id}.bam
    """
}














