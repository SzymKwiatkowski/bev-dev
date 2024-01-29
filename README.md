# Setup MMlab
```bash
conda create --name openmmlab python=3.8 -y
source activate openmmlab
conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia # Only forcuda 12.1 support for different check pytorch
```

```bash
pip install -U openmim
mim install mmengine
mim install 'mmcv>=2.0.0rc4'
mim install 'mmdet>=3.0.0'
mim install "mmdet3d>=1.1.0"
```

## Setup for bev
After cloning repo run devcontainer and then run setup.bash
```bash
conda create -n open-mmlab python=3.9 -y
conda activate open-mmlab
chmod +x setup.bash
bash setup.bash
```

## Downloading data
```bash
# download 'can_bus.zip'
unzip can_bus.zip 
# move can_bus to data dir
```

You can then clone bevformer repository and then use it to convert data:
```bash
# Clone and create directory with checkpoint
git clone https://github.com/fundamentalvision/BEVFormer.git
cd bevformer
mkdir ckpts
cd ckpts & wget https://github.com/zhiqi-li/storage/releases/download/v1.0/r101_dcn_fcos3d_pretrain.pth

# download 'can_bus.zip'
unzip can_bus.zip 
# move can_bus to data dir
python tools/create_data.py nuscenes --root-path ./data/nuscenes --out-dir ./data/nuscenes --extra-tag nuscenes --version v1.0 --canbus ./data
```
After all operations folder structure should look like this:
```
bevformer
├── projects/
├── tools/
├── configs/
├── ckpts/
│   ├── r101_dcn_fcos3d_pretrain.pth
├── data/
│   ├── can_bus/
│   ├── nuscenes/
│   │   ├── maps/
│   │   ├── samples/
│   │   ├── sweeps/
│   │   ├── v1.0-test/
|   |   ├── v1.0-trainval/
|   |   ├── nuscenes_infos_temporal_train.pkl
|   |   ├── nuscenes_infos_temporal_val.pkl
```

# Bev toolbox
```bash
conda create -n bev-toolbox python=3.8 -y
conda activate bev-toolbox
```

```bash
pip install numpy opencv-python
pip install bev-toolbox
```

```
git clone https://github.com/OpenDriveLab/Birds-eye-view-Perception
```

# FB Bev
```bash
conda create -n open-mmlab python=3.8 -y
conda activate open-mmlab
conda install -c nvidia cuda -y
```

```bash
pip install torch==1.12.0+cu113 torchvision==0.13.0+cu116  -f https://download.pytorch.org/whl/torch_stable.html
# Recommended torch>=1.12
pip install mmcv-full==1.5.2
pip install mmdet==2.24.0
pip install mmsegmentation==0.24.0
```

```bash
git clone https://github.com/NVlabs/FB-BEV.git
cd FB-BEV
pip install -e .
```

```
cd FB-BEV
mkdir ckpts

cd ckpts & wget TODO.pth
```


# NEAT

```
https://github.com/autonomousvision/neat.git
```

```bash
conda env create -f environment.yml
conda source neat
conda install pytorch torchvision torchaudio cudatoolkit=11.1 -c pytorch -c nvidia
```

```bash
pip install mmcv-full -f https://download.openmmlab.com/mmcv/dist/cu111/torch1.9.0/index.html
pip install mmsegmentation
```

Then locally run:
```bash
xhost local:root
docker run -it --net=host --gpus '"device=0"' --env="DISPLAY=$DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --env="NVIDIA_DRIVER_CAPABILITIES=all" carlasim/carla:0.9.10.1 ./CarlaUE4.sh --world-port=2000 -opengl -e SDL_AUDIODRIVER=dsp
```