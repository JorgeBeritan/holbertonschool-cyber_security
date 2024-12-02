#!/bin/bash
lsb_release -a | grep 'Distributor ID' | cut -d ':' -f 2 | xargs
