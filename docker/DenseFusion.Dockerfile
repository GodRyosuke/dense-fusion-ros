FROM ros-noetic:base

# work spase 作成
WORKDIR /root/catkin_ws/src/
RUN cd ../
COPY ./bash /root/
RUN ["/bin/bash", "/root/catkin_make.bash"]

# Dense Fusionのpakcageをコピー
WORKDIR /root/catkin_ws/src/dense-fusion-ros
COPY ./src/dense-fusion-ros /root/catkin_ws/src/dense-fusion-ros


# Dense Fusinの環境構築
RUN sudo apt-get install -y python3-pip
RUN pip install dense-fusion

# 依存パッケージのインストール
WORKDIR /root/catkin_ws
RUN sudo apt-get install -y ros-$ROS_DISTRO-image-transport \
    ros-$ROS_DISTRO-image-transport-plugins
RUN rosdep install -y -r --from-paths src --ignore-src src
# RUN sudo apt-get install -y \
#     ros-$ROS_DISTRO-jsk-footstep-msgs \
#     ros-$ROS_DISTRO-jsk-recognition-msgs \
#     ros-$ROS_DISTRO-pcl-msgs

RUN sudo apt-get update && \
    sudo apt-get upgrade -y

WORKDIR /root/catkin_ws/src/
RUN rm -rf dense-fusion-ros
# packageのmake
RUN ["/bin/bash", "/root/catkin_make.bash"]

