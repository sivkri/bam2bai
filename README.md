# create-bai-file
create bai file from respective bam file

# BAM2BAI

This repository contains a Bash script (`bam2bai.sh`) that converts SAM files to BAM files, sorts the BAM files, and creates corresponding BAI indexes using the `samtools` software. It also includes SLURM directives for job scheduling on a high-performance computing (HPC) cluster.

## Prerequisites

Before using this script, make sure you have the following prerequisites installed:

- `samtools`: The script uses `samtools` for file conversion, sorting, and indexing. Ensure that `samtools` is installed and accessible in your system's PATH. You can install `samtools` by following the instructions provided in the [samtools repository](https://github.com/samtools/samtools).

## Usage

To use this script, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/sivkri/bam2bai.git
   ```

2. Navigate to the repository's directory:

   ```bash
   cd bam2bai
   ```

3. Modify the SLURM directives in the script (`bam2bai.sh`) as per your cluster's requirements. The current directives are as follows:

   ```bash
   #SBATCH --nodes=1
   #SBATCH -J BAM2BAI
   #SBATCH --ntasks-per-node=4
   #SBATCH --mem=4gb
   #SBATCH --time=01:00:00
   #SBATCH -p biology_fast
   #SBATCH --mail-type=ALL 
   ```

   Adjust the values as needed, such as the number of nodes (`--nodes`), tasks per node (`--ntasks-per-node`), memory allocation (`--mem`), time limit (`--time`), partition (`-p`), and email notifications (`--mail-type` and `--mail-user`).

4. Prepare your input files:
   - Ensure that your SAM files are located in a directory specified by the `INPUT_DIR` variable in the script. By default, it is assumed that the input files are in the same directory as the script itself.
   - If your input files are located elsewhere, modify the line:
     
     ```bash
     cp ${SLURM_SUBMIT_DIR}/${INPUT_DIR}/* ${TMPDIR}
     ```
     
     Replace `${INPUT_DIR}` with the appropriate path.

5. Run the script:

   ```bash
   bash bam2bai.sh
   ```

   The script will submit the job to the cluster using SLURM and execute the necessary commands to convert, sort, and index the SAM files.

6. After the job completes, the resulting BAM files and BAI indexes will be stored in the `${OUTPUT_DIR}` directory. By default, the script assumes that the output directory is located in the same directory as the script. If you want to change the output directory, modify the line:
   
   ```bash
   mkdir $SLURM_SUBMIT_DIR/${OUTPUT_DIR}
   ```

   Replace `${OUTPUT_DIR}` with the desired path.

7. You can now access the converted and indexed files in the specified output directory.

8. Cleanup: The script will automatically delete the temporary directory `${TMPDIR}` after copying the files to the output directory.

## License

This project is licensed under the [MIT License](LICENSE).

## Issues

If you encounter any problems or have questions, please [open an issue](https://github.com/sivkri/bam2bai/issues) in this repository.

## Contributing

Contributions are welcome! If you would like to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes.
4. Commit your changes and push them to your fork.
5. Submit a pull request explaining your changes.

## Contact

For any further information or inquiries, please contact indiangene@gmail.com
