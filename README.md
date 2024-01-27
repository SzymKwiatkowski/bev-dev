# BEV setup
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
