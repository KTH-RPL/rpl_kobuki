KTH-RPL kobuki robot
---

Some reference:

- Manual book for turtlebot2 kobuki: https://learn.turtlebot.com/2015/02/01/1/  [But most of them are redundant]
- Official repo: [https://github.com/yujinrobot/kobuki.git](https://github.com/yujinrobot/kobuki.git)

Why we need this? 

1. kobuki is produced at 2015 which is really far away, this repo will only provide the thing you can run the kobuki robot [maunal control using keyboard or remote control].
2. This is for us to collected our own dataset **mainly indoor**, or tested our algorith in a **real robot**. 

Test System: Ubuntu 20.04 noetic

Test Day: 2023/03/08 20:21

Author: Kin ZHANG (https://kin-zhang.github.io/)

---

Sensor setup:

- Velodyne VLP-16
- Livox Avia

Will add more... like camera (rgb/depth).



Picture of it:

TODO

## Dependencies & Build

reference: https://github.com/yujinrobot/kobuki/issues/427

```bash
sudo apt update && sudo apt-get install liborocos-kdl-dev libusb-dev libftdi-dev ros-noetic-joy ros-noetic-ecl-core ros-noetic-ecl-console ros-noetic-ecl-mobile-robot -y

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



1. `kobuki.cpp` for the serial read thing.
2. `subscriber_callbacks.cpp` topic will send to kobuki


## Run

First you need change the config file, `base.yaml`, the most import thing is:

```bash
device_port: /dev/ttyUSB0
```

# Issues 

Some problem you may met, record here:

1. Cannot open /dev/ttyUSB0: Permission denied #26 https://github.com/esp8266/source-code-examples/issues/26

2. serial problem: https://stackoverflow.com/questions/11403932/python-attributeerror-module-object-has-no-attribute-serial
