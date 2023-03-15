#!/bin/bash
gnome-terminal  --tab --title="roscore" --command="bash -c 'roscore; exec bash'" & sleep 3
gnome-terminal  --tab --title="kobuki" --command="bash -c 'source /home/turtle/workspace/kobuki_ws/devel/setup.bash; roslaunch kobuki_node minimal.launch; exec bash'" \
                --tab --title="joy" --command="bash -c 'source /home/turtle/workspace/kobuki_ws/devel/setup.bash; roslaunch teleop_twist_joy teleop.launch; exec bash'" \
                --tab --title="livox" --command="bash -c 'source /home/turtle/workspace/kobuki_ws/devel/setup.bash; roslaunch livox_ros_driver livox_kobuki.launch; exec bash'" &
