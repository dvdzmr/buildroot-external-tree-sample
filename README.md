
## Usage

This project contains 2 bash scripts

`setup.sh` prepares your OS by installing dependencies and links the external tree to buildroot. Currently only supported on Linux distros based on debian/ubuntu, redhat and arch linux.

`make.sh` starts the build with a defconfig file you have to specify.


####  Clone and change to the directory of this repository
```bash
  git clone https://github.com/dvdzmr/buildroot-external-tree-sample.git && \
  cd buildroot-external-tree-sample
```


Then simply run `./setup.sh` and follow the guides instructions.

####  make.sh usage
```bash
  ./make.sh <configname>

  # For example if we want to use the pi3 configname

  ./make.sh raspberrypi3

  # If you want to manually set it up without any defconfig

  ./make.sh menuconfig

  # To see all available configs
  ls ./external_tree/configs
```
