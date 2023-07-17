#!/usr/bin/env bash
echo "Unplug the device, then press enter to continue"
read keyvalue
sleep 2
BEFORE=$(ls /dev/tty*)

echo "Plug the device into any port then press enter to continue"
read keyvalue

echo -n "Checking for device to enumerate.."
attempts=5
count=0
while  [ $count -lt $attempts ] && [[ -z $RESULT ]]
do
    ((count=count+1))
    echo -n "."
    AFTER=$(ls /dev/tty*)
    RESULT=$(diff <(echo "$BEFORE") <(echo "$AFTER") | tail -n 1 | cut -d " " -f2)

    sleep .3
done
echo ""
echo ""

printSeparator() {
    echo "================================================================"
}

# RESULT=$(diff <(echo "$BEFORE") <(echo "$AFTER") | tail -n 1 | cut -d " " -f2)
if [[ ! -z "$RESULT" ]] then
    sleep 1
    printSeparator
    echo ""
    echo "Today is your lucky day. Device found is: $RESULT"
    echo ""
    echo "Device owner/group are:"
    echo $(stat -c "Owner - %U:%u; Group - %G:%g" $RESULT)
    echo ""
    printSeparator
   else
    printSeparator
    echo ""
    echo "Whelp, no new device was detected. Maybe try again?" echo ""
    echo ""
    echo "Make sure you have configured udev rules for linux or installed drivers for windows."
    echo "linux udev - https://docs.platformio.org/en/stable/core/installation/udev-rules.html#platformio-udev-rules"
    echo "windows driver (you probably cannot even run this script if using windows, but here it is anyway) - https://docs.espressif.com/projects/esp-idf/en/v4.3-beta2/esp32s2/api-guides/dfu.html#usb-drivers-windows-only"
    echo ""
    printSeparator
fi 