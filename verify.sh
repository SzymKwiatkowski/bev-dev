#!/bin/bash
# cd mmdetection3d/
mim download mmdet3d --config pointpillars_hv_secfpn_8xb6-160e_kitti-3d-car --dest .
python demo/pcd_demo.py demo/data/kitti/000008.bin pointpillars_hv_secfpn_8xb6-160e_kitti-3d-car.py hv_pointpillars_secfpn_6x8_160e_kitti-3d-car_20220331_134606-d42d15ed.pth --show



docker run -it --net=host --gpus '"device=0"' --env="DISPLAY=$DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --env="NVIDIA_DRIVER_CAPABILITIES=all" carlasim/carla:0.9.10.1 ./CarlaUE4.sh --world-port=2000 -opengl -e SDL_AUDIODRIVER=dsp