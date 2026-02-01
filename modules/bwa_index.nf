process BWA_INDEX {

    input:
        path reference

    output:
        tuple path(reference), path("${reference}.*")

    script:
    """
    ${params.bwa} index ${reference}
    """
}


