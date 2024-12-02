#!/bin/bash
#SBATCH --job-name=wandb_sweep          
#SBATCH --output=wandb_sweep.%j.out     
#SBATCH --time=23:59:59                 
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-gpu=4
#SBATCH --constraint='GPU_SKU:A100_SXM4&GPU_MEM:80GB'
#SBATCH --mail-type=ALL

# Environment setup
export DEEP_SSM_DATA=/scratch/groups/swl1
module load cuda/12.4

# Activate conda environment
source /scratch/users/xavier18/miniconda3/bin/activate deep_ssm

# Get Sweep ID from the command line argument
SWEEP_ID=$1

# Check if a Sweep ID was provided
if [ -z "$SWEEP_ID" ]; then
  echo "Error: No Sweep ID provided. Usage: sbatch wandb_agent.sbatch <SWEEP_ID>"
  exit 1
fi

# Construct the full Sweep Identifier
FULL_SWEEP_ID="xavier_gonzalez/speech_bci/$SWEEP_ID"

# Run the W&B agent
wandb agent $FULL_SWEEP_ID
