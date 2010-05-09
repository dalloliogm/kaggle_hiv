
seqs: nucl_seqs prot_seqs

nucl_seqs: pr.nuc.fasta rt.nuc.fasta
prot_seqs: pr.prot.fasta rt.prot.fasta

pr.nuc.fasta: training_data.csv
	tail -n+2 training_data.csv|gawk -F, '{print ">ind_"$$1"\n"$$3}' |sed 's/\"//g' > pr.nuc.fasta
rt.nuc.fasta: training_data.csv
	tail -n+2 training_data.csv|gawk -F, '{print ">ind_"$$1"\n"$$4}' |sed 's/\"//g' > rt.nuc.fasta

pr.prot.fasta: pr.nuc.fasta
	transeq -sequence $^ -outseq $@ -frame=6
rt.prot.fasta: rt.nuc.fasta
	transeq -sequence $^ -outseq $@ -frame=6

