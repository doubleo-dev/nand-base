NAND flash development Git Submodules
===

## Hardware and Environment

* MCU: ESP32-S3
* PC: Debian GNU/Linux "sid"

## 1. Base Installation

1. Clone this repository to `~/nand-submodules`

    ```bash
    git clone --recursive https://github.com/doubleo-dev/nand-submodules.git ~/nand-submodules
    ```

## 2. RIOT OS Installation

1. Set `RIOTBASE` to the `RIOT/` submodule in this repository

    ```bash
    echo 'export RIOTBASE="$HOME/nand-submodules/RIOT"' >> ~/.bashrc
    ```

2. Install required dependencies

    *Reference: https://doc.riot-os.org/getting-started.html#compiling-riot*

    ```bash
    sudo apt install git gcc-arm-none-eabi make gcc-multilib libstdc++-arm-none-eabi-newlib openocd gdb-multiarch doxygen wget unzip python3-serial
    ```

3. Install the local toolchain for ESP32-S3

    *Reference: https://doc.riot-os.org/group__cpu__esp32.html#esp32_local_toolchain_installation*

    ```bash
    $RIOTBASE/dist/tools/esptools/install.sh esp32s3
    ```

4. (One-time) Export the local toolchain setup script

    ```bash
    . "$RIOTBASE/dist/tools/esptools/export.sh" esp32s3
    ```

5. (Permanent) Add the export command to `~/.bashrc`

    ```bash
    echo '. "$RIOTBASE/dist/tools/esptools/export.sh" esp32s3 > /dev/null' >> ~/.bashrc
    ```
