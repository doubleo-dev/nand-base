NAND flash development Git Submodules - ESP-IDF FreeRTOS based
===

## Hardware and Environment

* MCU: ESP32-S3
* PC: Debian GNU/Linux "sid"

## 1. Auto Installation and Configuration

1. Clone this repository to `~/nand-base`

    ```bash
    git clone --recursive https://github.com/doubleo-dev/nand-base.git ~/nand-base
    ```

2. Set the environmental variables

    ```bash
    echo 'export PATH="~/nand-base/bin:$PATH"' >> ~/.bashrc
    ```

    *Restart the shell after this step.*

3. **(Each time)** Run the command to activate the ESP-IDF base

    ```bash
    . activate-nand-esp
    ```

    or

    ```bash
    . ane
    ```

## 2. Manual Installation

***Not recommended.** Please follow above **Auto Installation and Configuration**.*

### 1. Anaconda Installation

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

4. Create a **Python 3.11* environment named `do-nand-esp`

    *Reference: https://github.com/espressif/esp-idf/blob/master/.mypy.ini*

    ```bash
    conda create -n do-nand-esp python=3.11
    ```

5. **(Each time)** Activate the `do-nand-esp` environment

    ```bash
    conda activate do-nand-esp
    ```

### 2. ESP-IDF Installation

1. Install required dependencies

    *Reference: https://docs.espressif.com/projects/esp-idf/en/v5.4.1/esp32s3/get-started/linux-macos-setup.html*

    ```bash
    sudo apt install git wget flex bison gperf python3 python3-pip python3-venv cmake ninja-build ccache libffi-dev libssl-dev dfu-util libusb-1.0-0
    ```

2. Navigate to the `esp-idf/` directory

    ```bash
    cd ~/nand-base/esp/esp-idf
    ```

3. Download ESP-IDF submodules recursively

    ```bash
    git submodule update --init --recursive
    ```

4. Set the desired ESP-IDF tools path to `~/.bashrc`

    ```bash
    echo 'export IDF_TOOLS_PATH="~/nand-base/esp/.espressif"' >> ~/.bashrc
    ```

    *Restart the shell after this step.*

5. Install ESP-IDF

    *This may fail if Python != 3.11. In this case, do **Anaconda Installation** above.*

    ```bash
    conda activate do-nand-esp-idf        # Python 3.10 or 3.11 required; Not compatible with Python <= 3.9 and >= 3.12
    ./install.sh all
    ```

6. Add the export command to `~/.bashrc`

    ```bash
    echo '. "$HOME/nand-base/esp/esp-idf/export.sh" > /dev/null 2>&1' >> ~/.bashrc
    ```

    *Restart the shell after this step.*

7. **(Each time)** Set the development board target to ESP32-S3 in your project

    ```bash
    cd "$IDF_PATH/examples/get-started/hello_world/"   # Your actual project location
    idf.py set-target esp32s3
    ```

## Uninstallation

1. Remove Espressif toolchain directory

    **At your own risk:**
    *if you installed other Espressif toolchains, this may break your setup.*

    ```bash
    rm -rf ~/nand-base/esp/.espressif
    ```

2. Remove Anaconda

    *Reference: https://www.anaconda.com/docs/getting-started/anaconda/uninstall*

    ```bash
    rm -rf ~/anaconda3
    rm -rf ~/.condarc ~/.conda ~/.continuum
    ```

3. Remove export codes from `~/.bashrc`

    **At your own risk.**

    This guide may ahve added the following lines into `.bashrc`:

    * `export PATH="~/nand-base/bin:$PATH"`
    * `export IDF_TOOLS_PATH="~/nand-base/esp/.espressif"`
    * `. "$HOME/nand-base/esp/esp-idf/export.sh" > /dev/null 2>&1`
    * The lines between `# >>> conta initialize >>>` and `# <<< conda initialize <<<`

4. Remove this repository located at `~/nand-base`

    **This will remove all other NAND flash development bases.**

    ```bash
    rm -rf ~/nand-base
    ```
