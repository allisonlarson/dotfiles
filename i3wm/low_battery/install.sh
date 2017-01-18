#!/bin/bash

echo "Hello I am your installer"
cp low_battery_warning.sh /etc/acpi/
echo "low_battery_warning.sh has been copied to /etc/acpi"
cp battery /etc/acpi/events/
echo "battery event has been copied to /etc/acpi/events"
