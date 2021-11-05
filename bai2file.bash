#!/bin/bash
#SBATCH --nodes=1
#SBATCH -J BAM2BAI
#SBATCH --ntasks-per-node=4
#SBATCH --mem=4gb
#SBATCH --time=01:00:00
#SBATCH -p biology_fast
#SBATCH --mail-type=ALL 
#SBATCH --mail-user=sivkri@amu.edu.pl

module load samtools

export TMPDIR="/tmp/lustre_shared/${USER}/${SLURM_JOBID}"
export SCR=${TMPDIR}
mkdir -p ${TMPDIR}
cp ${SLURM_SUBMIT_DIR}/${INPUT_DIR}/* ${TMPDIR}
cd $TMPDIR

samtools view -S -b abi1-ABA-1.sam > abi1-ABA-1.bam
samtools sort abi1-ABA-1.bam abi1-ABA-1.sorted.out
samtools index abi1-ABA-1.sorted.out.bam

mkdir $SLURM_SUBMIT_DIR/${OUTPUT_DIR}
cp -r $TMPDIR/* $SLURM_SUBMIT_DIR/${OUTPUT_DIR}/
rm -rf $TMPDIR

