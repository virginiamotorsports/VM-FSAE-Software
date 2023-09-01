#! /bin/bash
locale  # check for UTF-8

sudo apt update && sudo apt install locales -y
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale  # verify settings
sudo apt install software-properties-common -y
sudo add-apt-repository universe -y
sudo apt update && sudo apt install curl gnupg2 lsb-release -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update
sudo apt upgrade -y
sudo apt install ros-humble-desktop -y

sudo apt-get install ros-humble-udp-msgs ros-humble-rviz-common ros-humble-geographic-msgs ros-humble-osrf-testing-tools-cpp ros-humble-ament-cmake-google-benchmark ros-humble-random-numbers ros-humble-ros-testing ros-humble-point-cloud-msg-wrapper ros-humble-automotive-platform-msgs ros-humble-apex-test-tools ros-humble-pcl-ros ros-humble-joy-linux ros-humble-sensor-msgs-py ros-humble-gps-msgs ros-humble-nmea-msgs ros-humble-gps-tools ros-humble-can-msgs ros-humble-tf-transformations ros-humble-ament-cmake-nose -y

sudo apt install libgeographic-dev python3-colcon-common-extensions python3-pip libalglib-dev -y

echo "alias humble='source /opt/ros/humble/setup.bash'" >> ~/.bash_aliases
if [ "$(zsh --version 2>/dev/null)" != "" ]
then
    echo "alias humble='source /opt/ros/humble/setup.zsh'" >> ~/.zshrc
fi

pip3 install geographiclib transforms3d

echo "Check for errors, otherwise sucsessful install"

