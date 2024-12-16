#!/bin/sh

# Check if the OVS database exists; if not, create it
if [ ! -f /etc/openvswitch/conf.db ]; then
    echo "Creating OVS database at /etc/openvswitch/conf.db"
    ovsdb-tool create /etc/openvswitch/conf.db /usr/share/openvswitch/vswitch.ovsschema
fi

echo "Starting OVSDB server..."
ovsdb-server --remote=punix:/var/run/openvswitch/db.sock

