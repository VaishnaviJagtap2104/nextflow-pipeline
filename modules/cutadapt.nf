process CUTADAPT {

    tag "$sample_id"

    publishDir "results/trimmed", mode: 'copy'

    input:
    tuple val(sample_id), path(reads)

    output:
    tuple val(sample_id), path("${sample_id}_trimmed.fastq.gz")

    script:
    """
    cutadapt -q 20 -m 30 \
      -o ${sample_id}_trimmed.fastq.gz \
      ${reads}
    """
}

