
check_dependency() {
	if ! [ -e "$1" ]; then
		echo "Can't find $1"
		echo "Please check submodules have installed correctly."
	fi
}

SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)
SPARK_FIRMWARE_DIR="$SCRIPT_DIR"/spark/core-firmware
OSC_SRC_DIR="$SCRIPT_DIR"/osc

echo "--> Initialising submodules"

git submodule init
git submodule update


echo "--> Checking dependencies"

check_dependency "$OSC_SRC_DIR"/README.md
check_dependency "$SCRIPT_DIR"/spark/core-common-lib/README.md
check_dependency "$SCRIPT_DIR"/spark/core-communication-lib/README.md
check_dependency "$SPARK_FIRMWARE_DIR"/README.md


echo "--> Installing OSC library files into Spark firmware directory"

OSC_FIRMWARE_SRC_DIR="$SPARK_FIRMWARE_DIR"/src/OSC
mkdir -p "$OSC_FIRMWARE_SRC_DIR"
cp "$OSC_SRC_DIR"/OSCBundle.cpp "$OSC_FIRMWARE_SRC_DIR"
cp "$OSC_SRC_DIR"/OSCData.cpp "$OSC_FIRMWARE_SRC_DIR"
cp "$OSC_SRC_DIR"/OSCMatch.c "$OSC_FIRMWARE_SRC_DIR"
cp "$OSC_SRC_DIR"/OSCMessage.cpp "$OSC_FIRMWARE_SRC_DIR"
cp "$OSC_SRC_DIR"/build.mk "$OSC_FIRMWARE_SRC_DIR"

OSC_FIRMWARE_INC_DIR="$SPARK_FIRMWARE_DIR"/inc/OSC
mkdir -p "$OSC_FIRMWARE_INC_DIR"
cp "$OSC_SRC_DIR"/OSCBundle.h "$OSC_FIRMWARE_INC_DIR"
cp "$OSC_SRC_DIR"/OSCData.h "$OSC_FIRMWARE_INC_DIR"
cp "$OSC_SRC_DIR"/OSCMatch.h "$OSC_FIRMWARE_INC_DIR"
cp "$OSC_SRC_DIR"/OSCMessage.h "$OSC_FIRMWARE_INC_DIR"

