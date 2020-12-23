# Event Clip Manager

The Event Clip Manager is c++ based application capable of create a RTSP Client service that connects to a RTSP Video Server, generate a videoclip and send it to a http video server. The creation of the RTSP Client is triggered by an event situation.

To test the app, the software contains an Api REST, capable of receive several events to trigger the clip generation and set configuration settings via POST requests.

# Features

  - Api REST for event triggering and set configurations (Camera MAC Address, videoclip duration, verbosity level, etc).
  - RTSP Server for testing purposes.


#### Configure video hosting server

Currently, the camera emulator is configured with the Huawei video hosting server. To change it, we must set its Ip and port in the init_script.sh file, changing the 'IP' and 'PORT' variables with de corresponding ones.

```sh
#!/bin/bash

echo "running main  --- Video Clip ---"

IP="200.32.54.152"
PORT="50040"
...
```

#### Docker building

First of all, we must create the 'clips/' directory, to store the videoclips generated:

```sh
$ mkdir main/clips
```

Build docker container:

```sh
$ sudo docker build -t eventcm:1.1 .
```

Run docker image (be sure that localport (5001) is not in used. For running several docker images, the localport must be modified. Docker port must remain in 5051)

```sh
$ sudo docker run -d -p 5001:5051 eventcm:1.1
```

To be sure that our docker image is running properly, using the command

```sh
$ sudo docker ps
```

We must observe a container similar to:

```sh
CONTAINER ID   IMAGE         COMMAND                  CREATED         STATUS         PORTS                      NAMES
59a50f1ec1b6   eventcm:1.1   \"/init_script.sh\"        5 seconds ago   Up 4 seconds   0.0.0.0:5001->5051/tcp     infallible_wilbur
```

#### Instructions

Firstly, before send a 'run_event' POST request we must set the camera MAC via a POST using the set_camera_MAC command.

1 - Set Camera MAC
```
POST  
{
    "command":"set_camera_MAC",
    "args":"AA:BB:CC:DD:EE:FF"
}
```

Finally, we could send any POST request available such as:

2 - Run event (movement_event, sound_event or record_request)

a - movement_event
```
POST  
{
    "command":"run_event",
    "args":"movement_event"
}
```

b - sound_event
```
POST  
{
    "command":"run_event",
    "args":"sound_event"
}
```
c - record_request
```
POST  
{
    "command":"run_event",
    "args":"record_request"
}
```

3 - Set clip duration (From 1 to 60 secs)

```
POST  
{
    "command":"set_clip_duration",
    "args":"15"
}
```

4 - Set verbosity level: 0 or 1 (not used with docker)

```
POST  
{
    "command":"set_verbosity_level",
    "args":"0"
}
```




