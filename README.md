NAND flash development Git Submodules
===

## Hardware and Environment

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

3. **(Each time)** Run the command to activate the development base

    **Note the leading dot and the required space in the commands**

    | Base name           | Full command            | Short command | MCU      |
    | ---                 | ---                     | ---           | ---      |
    | RIOT                | `. activate-nand-riot`  | `. anr`       | ESP32-S3 |
    | ESP-IDF (FreeRTOS)  | `. activate-nand-esp`   | `. ane`       | ESP32-S3 |


## 2. Uninstallation

1. Remove ESP-IDF tools directory

    ```bash
    rm -rf ~/nand-base/riot/.espressif
    rm -rf ~/nand-base/esp/.espressif
    ```

2. Remove this repository located at `~/nand-base`

    ```bash
    rm -rf ~/nand-base
    ```

3. Remove Anaconda

    **This will remove all other Anaconda environments.**

    *Reference: https://www.anaconda.com/docs/getting-started/anaconda/uninstall*

    ```bash
    rm -rf ~/anaconda3
    rm -rf ~/.condarc ~/.conda ~/.continuum
    ```

4. Remove export codes from `~/.bashrc`

    **At your own risk.**

    This guide may have added the following lines into `.bashrc`:

    * `export PATH="~/nand-base/bin:$PATH"`
    * The lines between `# >>> conta initialize >>>` and `# <<< conda initialize <<<`
