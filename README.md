PixelPusher protocol with Spixels hardware
==========================================

This is an example how to use the Spixels hardware with the PixelPusher
protocol. Another popular implementation is the [RGB Matrix][matrix-impl].

To compile, retrieve this repository with the `--recursive` option to get
all needed sub-modules.

```
git clone --recursive https://github.com/hzeller/spixels-pixelpusher
```

Then compile with `make`. The resulting binary `spixels-pixel-push` has the
following options.

```
usage: ./spixels-pixel-push <options>
Options:
        -S <strips>   : Number of connected LED strips (default: 16)
        -L <len>      : Length of LED strips (default: 144)
        -i <iface>    : network interface, such as eth0, wlan0. Default eth0
        -a <artnet-universe,artnet-channel>: if used with artnet. Default 0,0
        -u <udp-size> : Max UDP data/packet (default 1460)
                        Best use the maximum that works with your network (up to 65507).
```

You need to run this program as root so that the GPIO pins of the Raspberry Pi
can be written to.

[![PixelPusher simple][run-vid]](http://youtu.be/HAbR64yrjUk)

[run-vid]: ./img/spixels-video.jpg
[matrix-impl]: https://github.com/hzeller/rpi-matrix-pixelpusher