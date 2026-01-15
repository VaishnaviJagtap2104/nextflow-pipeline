process ALIGNMENT {

    tag "$sample_id"

    input:
    tuple val(sample_id), path(reads)
    val reference

    output:
    path "${sample_id}.bam"

    script:
    """
    bwa mem -t 4 ${reference} ${reads} |
    samtools view -Sb - > ${sample_id}.bam
    """
}

