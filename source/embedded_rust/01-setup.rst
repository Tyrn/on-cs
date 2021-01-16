Setting up a development environment
====================================

Reference
---------

- `The Embedded Rust Book <https://rust-embedded.github.io/book/>`__
- `Discovery <https://docs.rust-embedded.org/discovery/>`__
- `The Rustonomicon <https://doc.rust-lang.org/nomicon/>`__

Toolchain
---------

- According to `The Embedded Rust Book <https://rust-embedded.github.io/book/intro/tooling.html>`__
- According to `Discovery <https://docs.rust-embedded.org/discovery/03-setup/index.html>`__

Manjaro/Arch Linux
^^^^^^^^^^^^^^^^^^

Cortex-M3, ARMv7-M architecture (STM32F103C8T6, the *Blue Pill*)::

    $ rustup target add thumbv7m-none-eabi

Cortex-M4F and M7F with hardware floating point, ARMv7E-M architecture (STM32F3DISCOVERY)::

    $ rustup target add thumbv7em-none-eabihf

::

    $ cargo install cargo-binutils
    $ rustup component add llvm-tools-preview
    $ cargo install cargo-generate
    $ cargo install itm [--vers 0.3.1]

On the system (`archlinuxcn` repository required)::

    $ yay -S gdb-multiarch openocd qemu-arch-extra minicom

Udev rules, according to `The Embedded Rust Book
<https://rust-embedded.github.io/book/intro/install/linux.html#udev-rules>`__ (another
take on `Discovery
<https://docs.rust-embedded.org/discovery/03-setup/linux.html#udev-rules>`__, apparently not necessary):

`/etc/udev/rules.d/70-st-link.rules`::

    # STM32F3DISCOVERY rev A/B - ST-LINK/V2
    ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3748", TAG+="uaccess"

    # STM32F3DISCOVERY rev C+ - ST-LINK/V2-1
    ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374b", TAG+="uaccess"

Reload::

    sudo udevadm control --reload-rules


Project
-------

Configure
^^^^^^^^^

- According to `The Embedded Rust Book
  <https://docs.rust-embedded.org/book/start/hardware.html#configuring>`__
- According to `Discovery
  <https://docs.rust-embedded.org/discovery/05-led-roulette/build-it.html>`__

Target (`.cargo/config`)::

    ...
    [build]
    # Pick ONE of these compilation targets
    # target = "thumbv7m-none-eabi"    # Cortex-M3
    target = "thumbv7em-none-eabihf" # Cortex-M4F and Cortex-M7F (with FPU)
    ...

Target (`.cargo/config`, another take; ``cargo run`` restarting GDB)::

    [target.thumbv7em-none-eabihf]
    # runner = "arm-none-eabi-gdb -q"
    runner = "gdb-multiarch -q -x openocd.gdb"
    rustflags = [
      "-C", "link-arg=-Tlink.x",
    ]

Memory (`memory.x`)::

    /* Linker script for the STM32F303VCT6 */
    MEMORY
    {
      /* NOTE 1 K = 1 KiBi = 1024 bytes */
      FLASH : ORIGIN = 0x08000000, LENGTH = 256K
      RAM : ORIGIN = 0x20000000, LENGTH = 40K
    }

`openocd.cfg`, for the `Discovery` (based on STM32F303)::

    source [find board/st_nucleo_f3.cfg]

`openocd.cfg`, for the `Blue Pill`::

    source [find interface/stlink-v2.cfg]
    source [find target/stm32f1x.cfg]

`openocd.gdb`::

    target remote :3333
    load
    break main
    continue

Build and Debug
^^^^^^^^^^^^^^^