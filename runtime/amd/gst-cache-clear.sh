#!/bin/bash
# Clear GStreamer cache to force VA plugin to re-detect hardware encoders
# This is needed because the cache may have been built without GPU access
rm -rf /home/neko/.cache/gstreamer-1.0
# Force cache rebuild by running gst-inspect
sudo -u neko gst-inspect-1.0 vah264enc >/dev/null 2>&1
echo "GStreamer cache cleared and rebuilt"
