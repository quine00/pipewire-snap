#!/bin/bash
# Set PIPEWIRE_RUNTIME_DIR and PULSE_RUNTIME_PATH to the real XDG_RUNTIME_DIR
# (not the snap-private /run/user/UID/snap.pipewire) so that PipeWire finds
# the socket-activation fds passed by systemd at the standard paths
REAL_UID=$(id -u)
export PIPEWIRE_RUNTIME_DIR="/run/user/$REAL_UID"
export PULSE_RUNTIME_PATH="/run/user/$REAL_UID/pulse"
exec "$@"
