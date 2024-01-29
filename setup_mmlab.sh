#!/bin/bash

# CONDA_ENVS=/opt/conda/envs/openmmlab
conda install pytorch torchvision -c pytorch -y
pip install -U openmim
mim install mmengine
mim install 'mmcv>=2.0.0rc4'
mim install 'mmdet>=3.0.0'
git clone https://github.com/open-mmlab/mmdetection3d.git -b dev-1.x
cd mmdetection3d
pip install -v -e .
conda install openblas-devel -c anaconda
# conda install -c conda-forge mmcv-full
# export CPLUS_INCLUDE_PATH=CPLUS_INCLUDE_PATH:${CONDA_ENVS}/include
# replace ${YOUR_CONDA_ENVS_DIR} to your anaconda environment path e.g. `/home/username/anaconda3/envs/openmmlab`.
# pip install -U git+https://github.com/NVIDIA/MinkowskiEngine -v --no-deps --install-option="--blas_include_dirs=/opt/conda/include" --install-option="--blas=openblas"
