FROM ros-noetic:base

RUN sudo apt-get update
# Realsense の実行環境構築
RUN sudo apt-get install -y ros-$ROS_DISTRO-realsense2-camera && \
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE && \
    sudo add-apt-repository "deb https://librealsense.intel.com/Debian/apt-repo $(lsb_release -cs) main" -u && \
    sudo apt-get install -y librealsense2-dkms \
    librealsense2-utils

RUN sudo apt-get update && \
    sudo apt-get upgrade -y

WORKDIR /root/catkin_ws/src/
RUN git clone https://github.com/IntelRealSense/realsense-ros.git && \
    cd realsense-ros/ && \
    git checkout `git tag | sort -V | grep -P "^2.\d+\.\d+" | tail -1` && \
    cd ..
COPY ./bash /root/
RUN ["/bin/bash", "/root/realsense_make.bash"]
# CMD ["/bin/bash", "/root/launch_realsense.bash"]