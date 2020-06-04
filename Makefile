obj-m := ipi_benchmark.o

run:
	make -C /lib/modules/`uname -r`/build M=$$PWD
	sudo dmesg -c 
	sudo insmod ipi_benchmark.ko 2>/dev/null || true
	sudo dmesg

clean:
	-rm *.o *.mod modules.order Module.symvers 2>/dev/null ipi_benchmark.mod.c ipi_benchmark.ko
