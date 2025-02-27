ASSEMBLER = nasm
BOOTLOADER = boot/boot.s
KERNEL_SRC = src/kernel/sys.k
KERNEL_TEM = src/core/tem.asm		#coming soon
KERNEL_PKE = src/kernel/pke.sys
BOOTLOADER_BIN = bin/bootloader.bin
KERNEL_BIN = bin/system.bin
PKE_BIN = bin/pke.bin
DISK_IMG = Vinu/vinuos.img

.PHONY: all clean run

all: $(DISK_IMG)
	@echo " "
	@echo "============= QEMU ============="
	@echo " Build completed successfully! "
	@echo " "

$(BOOTLOADER_BIN): $(BOOTLOADER) 
	@mkdir -p bin
	@echo " "
	@echo "========== bootloader =========="
	@echo "     Compiling bootloader"
	@echo " "
	$(ASSEMBLER) -f bin $< -o $(BOOTLOADER_BIN)

$(KERNEL_BIN): $(KERNEL_SRC)
	@mkdir -p bin
	@echo " "
	@echo "============ Kernel ============"
	@echo "       Compiling kernel"
	@echo " "
	$(ASSEMBLER) -f bin $< -o $@

$(PKE_BIN): $(KERNEL_PKE)
	@mkdir -p bin
	@echo " "
	@echo "============ PKE ==============="
	@echo "       Compiling pke"
	@echo " "
	$(ASSEMBLER) -f bin $< -o $@

$(DISK_IMG): $(BOOTLOADER_BIN) $(KERNEL_BIN) $(PKE_BIN) 
	@mkdir -p OS
	@echo " "
	@echo "============= Vinu ============="
	@echo "      Creating r3vinu.img"
	@echo " "
	dd if=/dev/zero of=$(DISK_IMG) bs=512 count=2880
	dd if=$(BOOTLOADER_BIN) of=$(DISK_IMG) conv=notrunc
	dd if=$(KERNEL_BIN) of=$(DISK_IMG) bs=512 seek=1 conv=notrunc
	dd if=$(PKE_BIN) of=$(DISK_IMG) bs=512 seek=2 conv=notrunc

run: all
	@echo " "
	@echo "============= QEMU ============="
	@echo "    Running the OS in QEMU"
	@echo " "
	qemu-system-x86_64 -drive format=raw,file=$(DISK_IMG)

m: all
	@echo " "
	@echo "============= QEMU ============="
	@echo "    Running the OS in QEMU"
	@echo " "
	qemu-system-x86_64 -drive file=$(DISK_IMG),format=raw -vga std

clean:
	@echo " "
	@echo "Cleaning up..."
	@echo " "
	rm -f $(BOOTLOADER_BIN) $(KERNEL_BIN) $(PKE_BIN) $(DISK_IMG)
