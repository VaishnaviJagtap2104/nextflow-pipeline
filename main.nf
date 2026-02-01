include { PIPELINE } from './workflows/workflow.nf'

workflow {

   reads_ch = Channel
        .fromPath(params.reads)
        .map { file ->
            def sample_id = file.baseName.replaceFirst(/\.fastq$/, '')
            tuple(sample_id, file)
        }


    reads_ch.view()
    
    ref_ch = Channel.fromPath(params.reference)
    PIPELINE(reads_ch, ref_ch)  

}
