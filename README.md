Manual book for turtlebot2 kobuki: https://learn.turtlebot.com/2015/02/01/1/ 

Test System: noetic Ubuntu 20.04

Test Day: 2023/03/07

# New

From here: https://github.com/yujinrobot/kobuki/issues/427

## Dependencies & Build

```bash
sudo apt-get install liborocos-kdl-dev vros-noetic-ecl-* libusb-dev libftdi-dev -y


mkdir -p ~/kobuki_ws/src
cd ~/kobuki_ws/src
git clone https://github.com/yujinrobot/kobuki.git
git clone https://github.com/yujinrobot/yujin_ocs.git
git clone https://github.com/yujinrobot/kobuki_msgs.git
git clone https://github.com/yujinrobot/kobuki_core.git

cd yujin_ocs
mkdir save 
mv yocs_cmd_vel_mux save
mv yocs_controllers save
mv yocs_velocity_smoother save
rm -rf yocs*
cd save 
mv * ..
cd .. && rmdir save
cd ~/kobuki_ws/
catkin_make
```







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



## issue

1. Cannot open /dev/ttyUSB0: Permission denied #26 https://github.com/esp8266/source-code-examples/issues/26

2. serial problem: https://stackoverflow.com/questions/11403932/python-attributeerror-module-object-has-no-attribute-serial
