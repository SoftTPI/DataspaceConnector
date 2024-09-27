#!/bin/bash

# Variables
ARTIFACT_GROUP="de.fraunhofer.ids.messaging"
ARTIFACT_ID="broker"
ARTIFACT_VERSION="7.0.0"
JAR_FILE="./lib-repo/broker-7.0.0.jar"  # Adjust the path if necessary
# POM_FILE="./lib-repo/broker-6.1.0.pom"  # Specify the path to the POM file if you have it
LOCAL_REPO_DIR="./lib-repo"

# Check if the JAR file exists
if [ ! -f "$JAR_FILE" ]; then
    echo "JAR file not found: $JAR_FILE. Exiting."
    exit 1
fi

# Check if the POM file exists
# if [ ! -f "$POM_FILE" ]; then
#     echo "POM file not found: $POM_FILE. Exiting."
#     exit 1
# fi

# Install the artifact to the local Maven repository
echo "Installing $ARTIFACT_ID to local Maven repository..."
mvn install:install-file -Dfile="$JAR_FILE" \
    -DpomFile="$POM_FILE" \
    -DgroupId="$ARTIFACT_GROUP" \
    -DartifactId="$ARTIFACT_ID" \
    -Dversion="$ARTIFACT_VERSION" \
    -Dpackaging=jar

# Check if the installation was successful
if [ $? -eq 0 ]; then
    echo "Successfully installed $ARTIFACT_ID to local repository."
else
    echo "Failed to install $ARTIFACT_ID. Exiting."
    exit 1
fi

echo "Script completed successfully."
