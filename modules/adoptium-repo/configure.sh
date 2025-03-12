#!/bin/sh
# Configure module
set -euo pipefail

SCRIPT_DIR=$(dirname $0)
ARTIFACTS_DIR=${SCRIPT_DIR}/artifacts

pushd ${ARTIFACTS_DIR}
cp -pr * /
popd

