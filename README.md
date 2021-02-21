Hello World Cross Compile for Raspberry Pi
=

Following [this](https://robert.kra.hn/posts/2021-02-01_cross-compile-rust/) 
cross compile for pi tutorial, with some minor typo fixes (add "hf" to linker 
name etc).

Download the arm toolchain from [here](https://lisa.musl.cc/9.3.0/) by 
choosing `arm-linux-musleabihf-cross.tgz` to download. 
Download and unpack it then add the `bin` sub-directory to your `$PATH`

add an entry in ~/.cargo/config.toml like this
```
[target.armv7-unknown-linux-musleabihf]
linker = "arm-linux-musleabihf-ld"
```

then you can build using:
`cargo build --release --target=armv7-unknown-linux-musleabihf`

Make
==
`make`: will build and copy to remove device named `pi` with user named `andrew`