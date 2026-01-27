process ALIGNMENT {
    tag "$sample_id"

    input:
        tuple val(sample_id), path(trimmed_reads)
        path bwa_ref_bundle

    output:
        tuple val(sample_id), path("${sample_id}.bam")

    script:
    """
    bwa mem chr22.fa $trimmed_reads > ${sample_id}.sam
    samtools view -Sb ${sample_id}.sam > ${sample_id}.bam
    """
}














