FROM ros:melodic-perception
LABEL maintainer Kyle Usbeck

# Trick to get apt-get to not prompt for timezone in tzdata
ENV DEBIAN_FRONTEND=noninteractive

# Install MAVROS and some other dependencies for later
RUN apt-get update && apt-get install -y ros-melodic-mavros ros-melodic-mavros-extras ros-melodic-mavros-msgs vim wget screen

# Dependency from https://github.com/mavlink/mavros/blob/master/mavros/README.md
RUN wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh
RUN chmod +x install_geographiclib_datasets.sh
RUN ./install_geographiclib_datasets.sh

RUN apt-get install -y ros-melodic-move-base ros-melodic-move-base-msgs ros-melodic-desktop-full ros-melodic-slam-gmapping
RUN apt-get install -y ros-melodic-map-server ssh

# Fix the broken apm_config.yaml
COPY apm_config.yaml /opt/ros/melodic/share/mavros/launch/apm_config.yaml

# MAVLink Input
EXPOSE 5760

# Envs
ENV FCUURL=tcp://localhost:5760

# Copy some sample data into the container
COPY basic_localization_stage.bag /

# Finally the command
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh ${FCUURL}
