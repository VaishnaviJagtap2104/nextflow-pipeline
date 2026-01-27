process VARIANT_CALLING {

    tag "$sample_id"

    publishDir "results/vcf", mode: 'copy'

    input:
    tuple val(sample_id), path(sorted_bam), path(sorted_bai)
    path reference
    path indexed_ref

    output:
      tuple val(sample_id), path("${sample_id}.vcf.gz"), path("${sample_id}.vcf.gz.tbi")


    script:
    """
    bcftools mpileup -f $reference $sorted_bam | \
        bcftools call -mv -Oz -o ${sample_id}.vcf.gz

    tabix -p vcf ${sample_id}.vcf.gz
    """

}