#!/usr/bin/env bash
echo "Unplug the device, then press enter to continue"
read keyvalue
BEFORE=$(ls /dev/tty*)
# echo $BEFORE

echo "Plug the device into any port then press enter to continue"
read keyvalue
echo "Device enumeration can take a second and I know everyone is impatient, so I tricked you into reading this message while enumeration occurs.\
If you press enter now, the device should have finished enumeration."
read keyvalue
AFTER=$(ls /dev/tty*)
# echo $AFTER

printSeparator() {
    echo "================================================================"
}


RESULT=$(diff <(echo "$BEFORE") <(echo "$AFTER") | tail -n 1 | cut -d " " -f2)
if [[ ! -z "$RESULT" ]] then
    printSeparator
    echo ""
    echo "Today is your lucky day. Device found is: $RESULT"
    echo ""
    echo "Device owner/group are:"
    echo $(stat -c "Owner - %U:%u; Group - %G:%g" $RESULT)
    echo ""
    printSeparator
    echo ""
    echo "Make sure you have configured udev rules for linux or installed drivers for windows."
    echo "linux udev - https://docs.platformio.org/en/stable/core/installation/udev-rules.html#platformio-udev-rules"
    echo "windows driver (you probably cannot even run this script if using windows, but here it is anyway) - https://docs.espressif.com/projects/esp-idf/en/v4.3-beta2/esp32s2/api-guides/dfu.html#usb-drivers-windows-only"
else
    echo "Whelp, no new device was detected. Maybe try again?"
fi 