#!/bin/bash
echo '$1 ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers.d/allow_$1