import cv2
import numpy as np
from bev_toolbox.data_aug import RandomScaleImageMultiViewImage

# Declare an augmentation pipeline
transform = RandomScaleImageMultiViewImage(scales=[0.9, 1.0, 1.1])

# multiple-view images
imgs = [cv2.imread(f'Birds-eye-view-Perception/example/cam{i}_img.jpg') for i in range(5)]
# intrinsic parameters of cameras
cam_intr = [np.load(f'Birds-eye-view-Perception/example/cam{i}_intrinsic.npy') for i in range(5)]
# extrinsic parameters of cameras
cam_extr = [np.load(f'Birds-eye-view-Perception/example/cam{i}_extrinsic.npy') for i in range(5)]
# transformations from lidar to image
lidar2img = [np.load(f'Birds-eye-view-Perception/example/cam{i}_lidar2img.npy') for i in range(5)]

# Augment an image
imgs_new, cam_intr_new, lidar2img_new = transform(imgs, cam_intr, cam_extr, lidar2img)