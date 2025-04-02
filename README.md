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

## 3. ESP-IDF Installation

1. Install required dependencies

    *Reference: https://docs.espressif.com/projects/esp-idf/en/v4.4.8/esp32s3/get-started/linux-setup.html#standard-setup-of-toolchain-for-linux*

    *Note on `python3-virtualenv`: https://github.com/espressif/esp-idf/issues/11336#issuecomment-1535876184*

    ```bash
    sudo apt install git wget flex bison gperf python3 python3-pip python3-setuptools cmake ninja-build ccache libffi-dev libssl-dev dfu-util libusb-1.0-0 python3-virtualenv
    ```

2. Download ESP-IDF with RIOT OS patches

    *Reference: https://github.com/RIOT-OS/RIOT/tree/master/pkg/esp32_sdk*

    ```bash
    make -f ~/nand-submodules/esp-idf.Makefile
    ```

3. Navigate to the `esp-idf/` directory

    ```bash
    cd ~/nand-submodules/esp-idf
    ```

4. Download ESP-IDF submodules recursively

    ```bash
    git submodule update --init --recursive
    ```

5. Install ESP-IDF

    ```bash
    ./install.sh all
    ```

6. (One-time) Export the local environment variables setup script

    ```bash
    . "$HOME/nand-submodules/esp-idf/export.sh"
    ```

7. (Permanent) Add the export command to `~/.bashrc`

    ```bash
    echo '. "$HOME/nand-submodules/esp-idf/export.sh" > /dev/null 2>&1' >> ~/.bashrc
    ```

8. (Each time) Set the development board target to ESP32-S3 in your project

    ```bash
    cd "$IDF_PATH/examples/get-started/hello_world/"   # Your actual project location
    idf.py set-target esp32s3
    ```
