#!/bin/bash
lsb_release -a 2>/dev/null | grep 'Distributor ID' | cut -d ':' -f 2 | xargs
