# Vinos 7 Pre-Version v25F7

## About Vinos 7

Vinos 7 revives old 16-bit systems and will soon expand to 32-bit. It’s a fun project for computer enthusiasts who want to try something new.

## Technical Details

I'm working on a 32-bit system

- Operating system: **Vinos 7**
- Current version: **v25F7**
- Bootloader version: **E4**
- Kernel type: **16-bit**
- Kernel name: **pke (pong-kernel)**
- Current features:
  - Fully working Pong game
  - Print functions and other basic system features
  - Half-working Tetris game

## Future Plans

- Transition to a 32-bit system
- Expanding the library of working games and system functions

## Requirements

- QEMU (for virtualization)
- NASM (assembler)
- make (for build and run)

## Installation

1. Clone the repository:

```bash
git clone https://github.com/SloopyCode/Vinos7pre.git
cd Vinos7
```

2. Ensure dependencies:

- **Arch/Manjaro:**

```bash
sudo pacman -Syu qemu nasm make
```

- **Debian/Ubuntu/Mint:**

```bash
sudo apt update && sudo apt install qemu nasm make
```

- **MacOS (using Homebrew):**

```bash
brew install qemu nasm make
```

- **Windows:**
 **No information available on how to compile directly on Windows**

## Usage

To compile Vinos 7 Pre-Version v25F7:

```bash
make
```

To start Vinos 7 Pre-Version v25F7 in QEMU:

```bash
make run
```

## Contributing

Pull requests and issues are welcome! If you want to contribute new features or bug fixes, please create a branch and provide a clean, well-documented solution.

