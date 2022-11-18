FROM dense-fusion-ros:wander

RUN sudo apt-get install -y python2
WORKDIR /usr/bin/
RUN ln python3 python

RUN pip3 install pyyaml