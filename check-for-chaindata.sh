#!/bin/sh
set -eu

GETH_CHAINDATA_DIR=$GETH_DATA_DIR/geth/chaindata
if [ -d "$GETH_CHAINDATA_DIR" ]; then
    echo "$GETH_CHAINDATA_DIR existing, skipping init"
    exit 0
fi
if [ ! -d "$GETH_CHAINDATA_DIR" ]; then
    echo "$GETH_CHAINDATA_DIR missing, running init"
    echo "Retrieving genesis file $L2GETH_GENESIS_URL"
    TEMP_DIR=$(mktemp -d)
    wget -O "$TEMP_DIR"/genesis.json "$L2GETH_GENESIS_URL"
    geth init \
      --datadir=/"$GETH_DATA_DIR" \
      "$TEMP_DIR"/genesis.json
    exit 0
fi
echo "This should not happen, exiting with error"
exit 1