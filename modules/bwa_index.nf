process BWA_INDEX {
    stageInMode 'copy'        

    input:
        path reference

    output:
        tuple path(reference), path("${reference}.*")

    script:
    """
    ${params.bwa} index ${reference}
    """
}


