#TARGET_ARCH := armv7-unknown-linux-musleabihf # For arm7 targets
TARGET_ARCH := arm-unknown-linux-musleabihf # For piZero target
REMOTE_HOST := andrew@pi
REMOTE_DIR := /home/andrew/bin

# NOTE using "arm" target not "arm7" for PiZero

all: pi

clean:
	@cargo clean

.PHONY: release
release: target/armv7-unknown-linux-musleabihf/release/hello

target/arm-unknown-linux-musleabihf/release/hello:
	@PATH=../arm-linux-musleabihf-cross/arm-linux-musleabihf/bin:${PATH} cargo build --release --target=${TARGET_ARCH}

target/armv7-unknown-linux-musleabihf/release/hello:
	@PATH=../arm-linux-musleabihf-cross/arm-linux-musleabihf/bin:${PATH} cargo build --release --target=${TARGET_ARCH}

.PHONY: debug
debug: target/armv7-unknown-linux-musleabihf/debug/hello

target/arm-unknown-linux-musleabihf/debug/hello:
	@PATH=../arm-linux-musleabihf-cross/arm-linux-musleabihf/bin:${PATH} cargo build --target=${TARGET_ARCH}

target/armv7-unknown-linux-musleabihf/debug/hello:
	@PATH=../arm-linux-musleabihf-cross/arm-linux-musleabihf/bin:${PATH} cargo build --target=${TARGET_ARCH}

.PHONY: pi
pi: target/arm-unknown-linux-musleabihf/debug/hello
	rsync -azh $< ${REMOTE_HOST}:${REMOTE_DIR}/hello

# Detect remote target Pi type and required Arm Architecture
# PiZero
# Linux rpi0 4.19.66+ #1253 Thu Aug 15 11:37:30 BST 2019 armv6l GNU/Linux
# Pi2 and above
# Linux rpi-home 5.4.79-v7+ #1373 SMP Mon Nov 23 13:22:33 GMT 2020 armv7l GNU/Linux

