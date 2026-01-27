include { CUTADAPT }        from '../modules/cutadapt.nf'
include { FASTQC }         from '../modules/fastqc.nf'
include { ALIGNMENT }      from '../modules/alignment.nf'
include { SORTBAM }        from '../modules/sortbam.nf'
include { VARIANT_CALLING } from '../modules/variant_calling.nf'
include { BWA_INDEX }      from '../modules/bwa_index.nf'

workflow PIPELINE {

    take:
        reads_ch
        ref_fa_ch

    main:

        indexed_ref = BWA_INDEX(ref_fa_ch)

        trimmed_ch = CUTADAPT(reads_ch)

        aligned_ch = ALIGNMENT(trimmed_ch, indexed_ref)

        sorted_ch  = SORTBAM(aligned_ch)

        VARIANT_CALLING(sorted_ch, ref_fa_ch, indexed_ref)
}
