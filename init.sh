
check_dependency() {
	if ! [ -e "$1" ]; then
		echo "Can't find $1"
		echo "Please check submodules have installed correctly."
	fi
}

SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)
SPARK_FIRMWARE_DIR="$SCRIPT_DIR"/spark/core-firmware
OSC_SRC_DIR="$SCRIPT_DIR"/osc
HTTP_SRC_DIR="$SCRIPT_DIR"/http-server
OWL_SRC_DIR="$SCRIPT_DIR"/core

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

# use custom osc build.mk (avoids multiple definitions when compiling)
cp "$OWL_SRC_DIR"/osc-build.mk "$OSC_FIRMWARE_SRC_DIR"/build.mk

OSC_FIRMWARE_INC_DIR="$SPARK_FIRMWARE_DIR"/inc/OSC
mkdir -p "$OSC_FIRMWARE_INC_DIR"
cp "$OSC_SRC_DIR"/OSCBundle.h "$OSC_FIRMWARE_INC_DIR"
cp "$OSC_SRC_DIR"/OSCData.h "$OSC_FIRMWARE_INC_DIR"
cp "$OSC_SRC_DIR"/OSCMatch.h "$OSC_FIRMWARE_INC_DIR"
cp "$OSC_SRC_DIR"/OSCMessage.h "$OSC_FIRMWARE_INC_DIR"


echo "--> Installing Http Server application files into Spark firmware directory"

HTTP_FIRMWARE_SRC_DIR="$SPARK_FIRMWARE_DIR"/src/http-server
mkdir -p "$HTTP_FIRMWARE_SRC_DIR"
cp "$HTTP_SRC_DIR"/http_parser.cpp "$HTTP_FIRMWARE_SRC_DIR"
cp "$HTTP_SRC_DIR"/HttpRequest.cpp "$HTTP_FIRMWARE_SRC_DIR"
cp "$HTTP_SRC_DIR"/HttpResponse.cpp "$HTTP_FIRMWARE_SRC_DIR"
cp "$HTTP_SRC_DIR"/slre.cpp "$HTTP_FIRMWARE_SRC_DIR"

cp "$OWL_SRC_DIR"/web-build.mk "$HTTP_FIRMWARE_SRC_DIR"/build.mk

HTTP_FIRMWARE_INC_DIR="$SPARK_FIRMWARE_DIR"/inc/http-server
mkdir -p "$HTTP_FIRMWARE_INC_DIR"
cp "$HTTP_SRC_DIR"/http_parser.h "$HTTP_FIRMWARE_INC_DIR"
cp "$HTTP_SRC_DIR"/HttpRequest.h "$HTTP_FIRMWARE_INC_DIR"
cp "$HTTP_SRC_DIR"/HttpResponse.h "$HTTP_FIRMWARE_INC_DIR"
cp "$HTTP_SRC_DIR"/slre.h "$HTTP_FIRMWARE_INC_DIR"


echo "--> Installing OWL application files into Spark firmware directory"

OWL_FIRMWARE_APP_DIR="$SPARK_FIRMWARE_DIR"/applications/

mkdir -p "$OWL_FIRMWARE_APP_DIR"/osm
cp "$OWL_SRC_DIR"/osc-application.cpp "$OWL_FIRMWARE_APP_DIR"/osm/application.cpp

mkdir -p "$OWL_FIRMWARE_APP_DIR"/web
cp "$OWL_SRC_DIR"/web-application.cpp "$OWL_FIRMWARE_APP_DIR"/web/application.cpp



