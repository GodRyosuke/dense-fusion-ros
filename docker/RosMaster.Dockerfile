FROM ros-noetic:base

COPY ./bash /root/
# コンテナ作ったらroscore起動
CMD ["/bin/bash", "/root/roscore.bash"]