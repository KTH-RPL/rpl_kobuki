#!/bin/bash
gnome-terminal  --tab --title="roscore" --command="bash -c 'roscore; exec bash'" & sleep 3
gnome-terminal  --tab --title="livox" --command="bash -c 'source /home/turtle/workspace/kobuki_ws/devel/setup.bash; roslaunch livox_ros_driver livox_kobuki.launch; exec bash'" \
                --tab --title="lidar" --command="bash -c 'source /home/turtle/workspace/kobuki_ws/devel/setup.bash; roslaunch velodyne_pointcloud VLP16_points.launch; exec bash'" &
