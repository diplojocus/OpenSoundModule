# OpenSoundModule

[Sparkcore](https://www.spark.io/) firmware for eurorack communication module.

### Setup
---
* Run the setup script

		$ ./init.sh

* Install and build the [Sparkcore library dependencies](https://github.com/spark/core-firmware/blob/master/README.md)

### Building 
---
* Compile the firmware

		$ cd ./spark/core-firmware/build
* OSC server

		$ APP=osm make
* Web server

		$ APP=web make

* Follow [these instructions](https://github.com/spark/core-firmware/blob/master/README.md#steps) to install the firmware. Although run this dfu-util command instead:

		$ dfu-util -d 1d50:607f -a 0 -s 0x08005000:leave -D applications/osm/osm.bin
* Note the web server app can be found in `applications/web/web.bin`


### Troubleshooting
---

These are some of the following issues I came across:

* LED constantly flashing green
	* [follow these steps first](http://docs.spark.io/troubleshooting/#other-problems-my-core-is-behaving-erratically)
	* [last resort - apply cc3000 patch](https://community.spark.io/t/failed-connecting-to-wifi/648/52)

	
