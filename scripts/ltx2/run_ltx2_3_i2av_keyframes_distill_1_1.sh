#!/bin/bash

# set path first
lightx2v_path=/path/to/LightX2V
model_path=/path/to/LTX-2.3

export CUDA_VISIBLE_DEVICES=0

# set environment variables
source ${lightx2v_path}/scripts/base/base.sh

python -m lightx2v.infer \
--model_cls ltx2 \
--task i2av \
--image_path "${lightx2v_path}/image_auto/001_f0000.jpg,${lightx2v_path}/image_auto/002_f0041.jpg,${lightx2v_path}/image_auto/003_f0081.jpg,${lightx2v_path}/image_auto/004_f0122.jpg,${lightx2v_path}/image_auto/005_f0162.jpg,${lightx2v_path}/image_auto/006_f0203.jpg,${lightx2v_path}/image_auto/007_f0243.jpg,${lightx2v_path}/image_auto/008_f0284.jpg,${lightx2v_path}/image_auto/009_f0325.jpg,${lightx2v_path}/image_auto/010_f0365.jpg,${lightx2v_path}/image_auto/011_f0406.jpg,${lightx2v_path}/image_auto/012_f0446.jpg,${lightx2v_path}/image_auto/013_f0487.jpg,${lightx2v_path}/image_auto/014_f0527.jpg,${lightx2v_path}/image_auto/015_f0568.jpg" \
--model_path $model_path \
--config_json ${lightx2v_path}/configs/ltx2/ltx2_3_distill_1_1.json \
--prompt "A continuous first-person indoor shot from a low eye-level camera inside a quiet dormitory room at night. The shot opens facing an open wooden door and a narrow exit, with white walls, pale ceramic floor tiles, and soft neutral indoor lighting. A dark appliance stands close on the right edge of the frame near the doorway. The view glides forward out of the room, crosses the threshold, and smoothly reveals a clean residential corridor. The frame gently swings to the right, opening onto a long straight hallway with smooth white walls, beige floor tiles, fluorescent ceiling panels, and a calm, empty atmosphere. As the hallway settles into view, six closed light-wood doors pass by one after another along the right side of the frame. The perspective remains stable and realistic, with consistent geometry, soft indoor light, and no people entering the scene. After the sixth closed door, a bright white side opening appears on the right side of the hallway, and the view smoothly pivots into that opening. The new passage is narrower and quieter, with the same pale tiled floor and white walls, and a window and radiator gradually come into view at the far end. As the shot continues forward, a white drinking water dispenser appears on the right side near the wall, becoming larger and clearer until the camera comes to a gentle stop beside it." \
--negative_prompt "third-person view, external camera, overhead view, side view, visible person, visible body, visible hands, visible feet, visible shadow, mirror reflection, selfie angle, character entering frame, crowded hallway, people in corridor, open doors on the main hallway, wrong number of doors, fewer than six doors, more than six doors, missing right turn, wrong turn direction, extra corridor branch, wrong final destination, missing water dispenser, overshooting the water dispenser, stopping too early, stopping too late, abrupt camera shake, jitter, wobble, jerky motion, sudden acceleration, sudden deceleration, fast motion, running, rolling camera, tilted horizon, fisheye distortion, wide-angle warping, zoom in, zoom out, scene cut, jump cut, camera teleportation, inconsistent layout, broken geometry, warped walls, bent corridor, floating objects, duplicated doors, morphing objects, flickering lights, exposure change, color shift, blurry frames, low detail, low resolution, noisy image, compression artifacts, unrealistic lighting, unrealistic perspective, object deformation, stretched textures, unstable first-person viewpoint" \
--save_result_path ${lightx2v_path}/save_results/output_lightx2v_ltx2_3_i2av_keyframes_distill_1_1.mp4 \
--image_strength 0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8,0.8 \
--image_frame_idx 0,41,81,122,162,203,243,284,325,365,406,446,487,527,568 \
--target_video_length 569
