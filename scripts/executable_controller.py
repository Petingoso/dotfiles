#!/usr/bin/env python3

import os
import sys


try:
    import usb.core
    import usb.util
except ImportError:
    print("First, install the pyusb module with PIP or your package manager.")
else:
    if os.geteuid() != 0:
        print("You need to run this script with sudo")
        sys.exit()

    dev = usb.core.find(find_all=True)

    for d in dev:
        if d.idVendor == 0x045e and d.idProduct == 0x028e:
            d.ctrl_transfer(0xc1, 0x01, 0x0100, 0x00, 0x14)
finally:
    sys.exit()
