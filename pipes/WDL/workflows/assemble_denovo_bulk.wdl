import "assemble_denovo.wdl" as sub

workflow assemble_denovo_bulk {
  
  Array[File]+ reads_unmapped_bam_files
  File lastal_db_fasta
  File trim_clip_db
  Array[File]+ reference_genome_fasta
  File? novocraft_license

  scatter(reads_unmapped_bam in reads_unmapped_bam_files) {
    call sub.assemble_denovo {
      input:
        reads_unmapped_bam = reads_unmapped_bam,
        lastal_db_fasta = lastal_db_fasta,
        trim_clip_db = trim_clip_db,
        reference_genome_fasta = reference_genome_fasta,
        novocraft_license = novocraft_license
    }
  }
}