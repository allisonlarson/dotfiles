#! /bin/bash

echo "Hello I'm your installer"
cp screenlock.service /lib/systemd/system/sleep.target.wants/
echo "screenlock service has been copied to /lib/systemd/system/sleep.target.wants/"
