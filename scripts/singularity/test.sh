#!/bin/bash
set -x

# Validate critical environment variables
if [ -z "$GROUP" ]; then
    echo "Error: GROUP is not set."
    exit 1
fi

GPU=${CUDA_VISIBLE_DEVICES}

echo "Using CUDA device '${GPU}'"
# Launches a Singularity container using our image, and runs the provided command

# Set the environment variables for Singularity
export APPTAINER_HOME="$HOME"
export APPTAINER_LANG="$LANG"

# set for GPU jobs
export APPTAINERENV_CUDA_VISIBLE_DEVICES="${GPU}"
NVIDIAFLAG=--nv

# Run the Singularity container with the necessary bindings and environment variables
sg $GROUP -c "singularity run $NVIDIAFLAG \
    --env LANG=$APPTAINER_LANG \
    --env LC_ALL=C.UTF-8 \
    --bind $(pwd)/../../:/home/dockeruser/esim \
    --pwd /home/dockeruser/esim \
    --contain \
    $SINGULARITY_IMAGE \
    python3 -m scripts.testing.test_rte \
    ./data/preprocessed/RTE/test_data.pkl ./data/checkpoints/RTE/best.pth.tar"
