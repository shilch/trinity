#!/bin/bash
set -euo pipefail

# Damn, we have been caught!
# Of course, this is a fake fbset command because we are limited to working in docker.

cat <<"EOF"
mode "1024x768-0"
	# D: 0.000 MHz, H: 0.000 kHz, V: 0.000 Hz
	geometry 1024 768 1024 768 32
	timings 0 0 0 0 0 0 0
	accel true
	rgba 8/16,8/8,8/0,0/0
endmode
EOF
