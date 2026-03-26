process VARIANT_CALLING {

    tag "$sample_id"

    publishDir "results/vcf", mode: 'copy'

    input:
    tuple val(sample_id), path(sorted_bam), path(sorted_bai)
    tuple path(reference), path(indexes)


    output:
      tuple val(sample_id), path("${sample_id}.vcf.gz"), path("${sample_id}.vcf.gz.tbi")


    script:
    """
    ${params.bcftools} mpileup -f ${reference} ${sorted_bam} | \
    ${params.bcftools} call -mv -Oz -o ${sample_id}.vcf.gz
    ${params.tabix} -p vcf ${sample_id}.vcf.gz
    """

}