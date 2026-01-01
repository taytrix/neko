#!/bin/bash
# Clear GStreamer cache to force VA plugin to re-detect hardware encoders
# This script runs as neko user via supervisor (user=neko)
rm -rf ~/.cache/gstreamer-1.0
# Force cache rebuild - this will detect vah264enc from /dev/dri/renderD128
gst-inspect-1.0 vah264enc >/dev/null 2>&1
echo "GStreamer cache cleared and rebuilt"
