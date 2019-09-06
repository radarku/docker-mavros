#!/bin/bash

FCUURL=$1

source /opt/ros/melodic/setup.bash
roscd mavros
roslaunch mavros apm2.launch fcu_url:=${FCUURL} 2>&1 > /mavros.log &
bash
