process SORTBAM {
    tag "$sample_id"

    publishDir "results/bam", mode: 'copy'
    
     input:
    tuple val(sample_id), path(bam)

    output:
    tuple val(sample_id), path("${sample_id}.sorted.bam"), path("${sample_id}.sorted.bam.bai")

    script:
    """
    samtools sort -@ 4 ${bam} -o ${sample_id}.sorted.bam
    samtools index ${sample_id}.sorted.bam
    """
}

