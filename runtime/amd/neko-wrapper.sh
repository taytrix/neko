#!/bin/bash
# Clear stale GStreamer cache before neko starts
# This ensures VA plugins are detected even on first container boot
rm -rf ~/.cache/gstreamer-1.0
# Force rebuild with VA plugins - this detects vah264enc from /dev/dri/renderD128
gst-inspect-1.0 va >/dev/null 2>&1
# Now start neko-bin (the real binary) with all passed arguments
exec /usr/bin/neko-bin "$@"
