#!/bin/sh
# Configure module
set -e

SCRIPT_DIR=$(dirname $0)
ARTIFACTS_DIR=${SCRIPT_DIR}/artifacts

chown -R $USER:root $SCRIPT_DIR
chmod -R ug+rwX $SCRIPT_DIR
chmod ug+x ${ARTIFACTS_DIR}/opt/jboss/container/openjdk/jdk/*

pushd ${ARTIFACTS_DIR}
cp -pr * /
popd

# Set this JDK as the alternative in use
alternatives --set java /usr/lib/jvm/temurin-8-jdk/bin/java
alternatives --set javac /usr/lib/jvm/temurin-8-jdk/bin/javac

echo securerandom.source=file:/dev/urandom >> /usr/lib/jvm/temurin-8-jdk/jre/lib/security/java.security
