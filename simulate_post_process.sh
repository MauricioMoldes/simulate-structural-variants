####################
## simulate post-process
####################


# wgsim

wgsim -1151 -2151 -d320 -r0 -e0 -N750000 -R0 -X0 del/genome_rearranged_del.fasta del/simulated_del_1.fastq del/simulated_del_2.fastq
wgsim -1151 -2151 -d320 -r0 -e0 -N750000 -R0 -X0 ins/genome_rearranged_ins.fasta ins/simulated_ins_1.fastq ins/simulated_ins_2.fastq
wgsim -1151 -2151 -d320 -r0 -e0 -N750000 -R0 -X0 inv/genome_rearranged_inv.fasta inv/simulated_inv_1.fastq inv/simulated_inv_2.fastq
wgsim -1151 -2151 -d320 -r0 -e0 -N750000 -R0 -X0 dup/genome_rearranged_dup.fasta dup/simulated_dup_1.fastq dup/simulated_dup_2.fastq

# align 

bwa mem  reference_genome/hg19.fasta del/simulated_del_1.fastq del/simulated_del_2.fastq | samtools view -S -b > del/simulated_del.bam
bwa mem  reference_genome/hg19.fasta ins/simulated_ins_1.fastq ins/simulated_ins_2.fastq | samtools view -S -b > ins/simulated_ins.bam
bwa mem  reference_genome/hg19.fasta inv/simulated_inv_1.fastq inv/simulated_inv_2.fastq | samtools view -S -b > inv/simulated_inv.bam
bwa mem  reference_genome/hg19.fasta dup/simulated_dup_1.fastq dup/simulated_dup_2.fastq | samtools view -S -b > dup/simulated_dup.bam

#sort 

samtools sort del/simulated_del.bam  >  del/simulated_del.sorted.bam
samtools sort ins/simulated_ins.bam  >  ins/simulated_ins.sorted.bam
samtools sort inv/simulated_inv.bam  >  inv/simulated_inv.sorted.bam
samtools sort dup/simulated_dup.bam  >  dup/simulated_dup.sorted.bam


# index

samtools index del/simulated_del.sorted.bam
samtools index ins/simulated_ins.sorted.bam
samtools index inv/simulated_inv.sorted.bam
samtools index dup/simulated_dup.sorted.bam


scp -oProxyCommand="ssh -W %h:%p mmoldes@gw-in.ega.crg.eu" del/simulated_del.sorted.bam devers@apps-executor-01u:/vault/mauricio
scp -oProxyCommand="ssh -W %h:%p mmoldes@gw-in.ega.crg.eu" ins/simulated_ins.sorted.bam devers@apps-executor-01u:/vault/mauricio
scp -oProxyCommand="ssh -W %h:%p mmoldes@gw-in.ega.crg.eu" inv/simulated_inv.sorted.bam devers@apps-executor-01u:/vault/mauricio
scp -oProxyCommand="ssh -W %h:%p mmoldes@gw-in.ega.crg.eu" dup/simulated_dup.sorted.bam devers@apps-executor-01u:/vault/mauricio

scp -oProxyCommand="ssh -W %h:%p mmoldes@gw-in.ega.crg.eu" del/simulated_del.sorted.bam.bai devers@apps-executor-01u:/vault/mauricio
scp -oProxyCommand="ssh -W %h:%p mmoldes@gw-in.ega.crg.eu" ins/simulated_ins.sorted.bam.bai devers@apps-executor-01u:/vault/mauricio
scp -oProxyCommand="ssh -W %h:%p mmoldes@gw-in.ega.crg.eu" inv/simulated_inv.sorted.bam.bai devers@apps-executor-01u:/vault/mauricio
scp -oProxyCommand="ssh -W %h:%p mmoldes@gw-in.ega.crg.eu" dup/simulated_dup.sorted.bam.bai devers@apps-executor-01u:/vault/mauricio
