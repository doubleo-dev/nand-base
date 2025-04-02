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

    *After this, restart the shell.*

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

4. Add the export command to `~/.bashrc`

    ```bash
    echo '. "$RIOTBASE/dist/tools/esptools/export.sh" esp32s3 > /dev/null' >> ~/.bashrc
    ```

    *After this, restart the shell.*

## 3. Anaconda Installation

1. Download the Anaconda Linux 64-Bit (x86) Installer

    *Download: https://www.anaconda.com/download/success*

2. Make the installer executable

    ```bash
    chmod +x Anaconda3-VERSION-Linux-x86_64.sh
    ```

3. Run the installer

    ```bash
    ./Anaconda3-VERSION-Linux-x86_64.sh
    ```

    *Enable shell integration when prompted.*

    *Restart the shell after installation.*

4. Create a **Python 3.8** environment named `do-nand`

    *Reference: https://github.com/espressif/esp-idf/blob/master/.mypy.ini*

    ```bash
    conda create -n do-nand python=3.8
    ```

5. **(Each time)** Activate the `do-nand` environment

    ```bash
    conda activate do-nand
    ```

## 4. ESP-IDF Installation

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

    *This may fail if Python != 3.8. In this case, do **Anaconda Installation** above.*

    ```bash
    conda activate do-nand        # Python 3.8 required; Not compatible with Python >= 3.9
    ./install.sh all
    ```

6. Add the export command to `~/.bashrc`

    ```bash
    echo '. "$HOME/nand-submodules/esp-idf/export.sh" > /dev/null 2>&1' >> ~/.bashrc
    ```

    *After this, restart the shell.*

7. Install ESP-IDF Python dependencies

    *This may fail if Python != 3.8. In this case, do **Anaconda Installation** above.*

    ```bash
    conda activate do-nand        # Python 3.8 required; Not compatible with Python >= 3.9
    pip install -r ~/nand-submodules/RIOT/build/pkg/esp32_sdk/requirements.txt
    ```

8. **(Each time)** Set the development board target to ESP32-S3 in your project

    ```bash
    cd "$IDF_PATH/examples/get-started/hello_world/"   # Your actual project location
    idf.py set-target esp32s3
    ```
