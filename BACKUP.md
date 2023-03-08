# Old one (deprecated xx)

## Dependencies

- ROS-noetic

```bash
sudo apt install ros-noetic-joy ros-noetic-ecl-core ros-noetic-ecl-console ros-noetic-ecl-mobile-robot
sudo apt-get install python-catkin-tools
pip3 install pyserial
```



## catkin build

I remove some pkg for easy run the turtlebot is enough:

```bash
rm -rf yujin_ocs/yocs_waypoints_navi
rm -rf yujin_ocs/yocs_navigator
rm -rf kobuki_core/kobuki_ftdi/
rm -rf linux_peripheral_interfaces/libsensors_monitor linux_peripheral_interfaces/linux_peripheral_interfaces
```

