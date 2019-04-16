Docker Container for MAVROS
===========================

The purpose of this is to run [MAVROS](http://wiki.ros.org/mavros) from within Docker

DockerHub
---------

A pre-built Docker image is available on DockerHub at:

https://hub.docker.com/r/radarku/mavros

To download it, simply:

`docker pull radarku/mavros`
 
and to run it:

`docker run -it --rm --env FCUURL="tcp://192.168.1.113:5760" radarku/mavros`

...where the MAVLink stream is at the FCUURL (see Options section below).


Quick Start
===========

To build
--------

If you'd rather build the docker image yourself, checkout the source:

`git clone https://github.com/radarku/docker-mavros.git`

then go into the directory

`cd docker-mavros`

and build the docker image

`docker build --rm --tag mavros .`

To run
------

Start a SITL using:

```
docker run -it --rm -p 5760:5760 radarku/ardupilot-sitl
```

Find the IP address of the machine, then run the MAVROS container:

```
docker run -it --rm --env FCUURL="tcp://192.168.1.113:5760" mavros
```

where 192.168.1.113 is the IP of the machine running the ardupilot SITL


Options
-------

The [MAVROS page](https://github.com/mavlink/mavros/blob/master/mavros/README.md) specifies the various forms for the FCUURL as:

 *  Serial: `/path/to/serial/device[:baudrate]`
 *  Serial: `serial:///path/to/serial/device[:baudrate][?ids=sysid,compid]`
 *  Serial with hardware flow control: `serial-hwfc:///path/to/serial/device[:baudrate][?ids=sysid,compid]`
 *  UDP: `udp://[bind_host][:port]@[remote_host[:port]][/?ids=sysid,compid]`
 *  UDP broadcast until GCS discovery: `udp-b://[bind_host][:port]@[:port][/?ids=sysid,compid]`
 *  UDP broadcast (permanent): `udp-pb://[bind_host][:port]@[:port][/?ids=sysid,compid]`
 *  TCP client: `tcp://[server_host][:port][/?ids=sysid,compid]`
 *  TCP server: `tcp-l://[bind_host][:port][/?ids=sysid,compid]`

