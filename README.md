KTH-RPL kobuki robot
---

Some reference:

- Manual book for turtlebot2 kobuki: https://learn.turtlebot.com/2015/02/01/1/  [But most of them are redundant]
- Official repo: [https://github.com/yujinrobot/kobuki.git](https://github.com/yujinrobot/kobuki.git)

Why we need this? 

1. kobuki is produced in 2015 which is really far away, this repo will only provide the thing you can run the kobuki robot [maunal control using the keyboard or remote control].
2. This is for us to collect our own dataset **mainly indoor**, or tested our algorithm in a **real robot**. 
3. IF YOU DIRECTLY USE THE KOBUKI FROM KIN, there is no need to set up following this one. This one is for somebody who wants to reinstall it totally and setup by themselves.

Test System: Ubuntu 20.04 noetic

Test Day: 2023/03/09 17:53

Author: Kin ZHANG [https://kin-zhang.github.io/](https://kin-zhang.github.io/)

---

Sensor setup:

- Velodyne VLP-16
- Livox Avia

Will add more... like camera (rgb/depth).



Picture of it:

TODO (since Patric and I are rebuilding this power setting)

## Dependencies & Build

reference: https://github.com/yujinrobot/kobuki/issues/427, https://github.com/yujinrobot/kobuki/issues/382

```bash
sudo apt update && sudo apt-get install liborocos-kdl-dev libusb-dev libftdi-dev ros-noetic-joy ros-noetic-ecl-core ros-noetic-ecl-console ros-noetic-ecl-mobile-robot -y
```

clone this repo:
```bash
mkdir -p ~/kobuki_ws/src && cd ~/kobuki_ws/src
git clone TODO_public_link # this repo
```

build, if you want to setup sensor also, please follow [Sensor setup](#Sensor-setup)
```bash
cd ~/kobuki_ws
catkin build
```


1. `kobuki.cpp` for the serial read thing.
2. `subscriber_callbacks.cpp` topic will send to kobuki


## Sensor setup

Every sensor have their own driver, we need install them first, here we give two examples on how to setup livox and VLP-16. But maybe the NUC in the kobuki already have it if you are not from the scratch and reinstall everything.

Dependencies are velodyne need:

```bash
sudo apt update && apt install -y libpcap-dev
cd ~/kobuki_ws/src && mkdir driver && cd driver
git clone https://github.com/ros-drivers/velodyne.git
git clone https://github.com/Livox-SDK/livox_ros_driver.git
cd ~/kobuki_ws
catkin build
```

Reference: [ros_wiki_get_started_VLP16](http://wiki.ros.org/velodyne/Tutorials/Getting%20Started%20with%20the%20Velodyne%20VLP16)

## Run

1. you need change the config file, `base.yaml`, the most import thing is:

   ```bash
   device_port: /dev/ttyUSB0
   ```

2. Open the minimal one:

   ```bash
   roslaunch kobuki_node minimal.launch
   ```

3. AND THEN run keyboard control, so we can start the kobuki!

   ```bash
   roslaunch kobuki_keyop keyop.launch
   ```

   if everything success, we will see this, and then press keyboard `↑` button:

   ```bash
   Forward/back arrows : linear velocity incr/decr.
   Right/left arrows : angular velocity incr/decr.
   Spacebar : reset linear/angular velocities.
   d : disable motors.
   e : enable motors.
   q : quit.
   ```

4. Remote controller [Logitech F710 setup]

   ```bash
   # check the lsusb
   turtle@turtle-nuc /home » lsusb     
   Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
   Bus 001 Device 006: ID 046d:c21f Logitech, Inc. F710 Wireless Gamepad [XInput Mode] # <=== joy
   Bus 001 Device 007: ID 0403:6001 Future Technology Devices International, Ltd FT232 Serial (UART) IC # <=== serial
   ```
   Most of time is in the `/dev/input` as `js0`, we can edit with:
   ```bash
   sudo vim /etc/udev/rules.d/10-colca.rules
   KERNEL=="js*", SUBSYSTEM=="input", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c21f", MODE:="0777",SYMLINK+="logitech_joy"
   KERNEL=="ttyUSB*", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", MODE:="0777",SYMLINK+="kobuki_serial"
   service udev reload
   service udev restart
   # important step!! plugin out and in again!
   ```
   And we will see things by running following command, so that even more device is here, we will not lose them.
   ```bash
   turtle@turtle-nuc /home » ls -l /dev | grep -E "logitech|kob"
   lrwxrwxrwx  1 root   root             7 mar 10 10:37 kobuki_serial -> ttyUSB0
   lrwxrwxrwx  1 root   root             9 mar 10 10:31 logitech_joy -> input/js0
   ```

5. Control Manual
   Here is the button said
   - START : to start the robot, if you want to STOP
   - STOP : to stop robot
   - MODE : PLEASE TURN OFF THE MODE
   - RB && RIGHT mini sticks: forward speed
   - RB && LEFT mini sticks: left/right turn
   
   
## Demo of Running and sensor

TODO put some pics and videos here



# Issues 

Some problem you may met, record here:

1. Cannot open /dev/ttyUSB0: Permission denied #26 https://github.com/esp8266/source-code-examples/issues/26

2. serial problem: https://stackoverflow.com/questions/11403932/python-attributeerror-module-object-has-no-attribute-serial

3. Kobuki: malformed sub-payload detected: https://github.com/yujinrobot/kobuki/issues/382