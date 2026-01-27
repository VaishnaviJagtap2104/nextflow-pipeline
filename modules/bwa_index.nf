process BWA_INDEX {

    input:
        path reference

    output:
        path "${reference}*"

    script:
    """
    bwa index $reference
    """
}

