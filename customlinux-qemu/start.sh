#!bin/bash

qemu-system-x86_64 \
-kernel bzImage \
-initrd initrd.img \
-append "console=ttyS0 rdinit=/init" \
-nographic \
-m 512M \
-nic user,model=virtio-net-pci,hostfwd=tcp::4444-:8080
