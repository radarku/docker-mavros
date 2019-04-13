Docker Container for MAVROS
===========================

To build
--------

```
docker build --rm --tag mavros .
```

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
