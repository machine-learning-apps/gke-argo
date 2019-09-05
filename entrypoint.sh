#!/bin/sh

#This file retrieves GKE credentials and interacts with K8s via kubectl

set -e

# Check the presence of all required environment variables
if [ -z "${INPUT_ARGO_URL-}" ]; then
   echo "ARGO_URL not found. Exiting...."
   exit 1
fi

if [ -z "${INPUT_APPLICATION_CREDENTIALS-}" ]; then
   echo "APPLICATION_CREDENTIALS not found. Exiting...."
   exit 1
fi

if [ -z "${INPUT_PROJECT_ID-}" ]; then
   echo "PROJECT_ID not found. Exiting...."
   exit 1
fi

if [ -z "${INPUT_LOCATION_ZONE-}" ]; then
   echo "LOCATION_ZONE not found. Exiting...."
   exit 1
fi

if [ -z "${INPUT_CLUSTER_NAME-}" ]; then
   echo "CLUSTER_NAME not found. Exiting...."
   exit 1
fi

# Random String For Unique Argo Workflow ID
randomstring(){
    cat /dev/urandom | env LC_CTYPE=C tr -dc 'a-z' | fold -w 16 | head -n 1
}
WORKFLOW_NAME=$(randomstring)

# Recover Application Credentials For GKE Authentication
echo "$INPUT_APPLICATION_CREDENTIALS" | base64 -d > /tmp/account.json

# Use gcloud CLI to retrieve k8s authentication
gcloud auth activate-service-account --key-file=/tmp/account.json
gcloud config set project "$INPUT_PROJECT_ID"
gcloud container clusters get-credentials "$INPUT_CLUSTER_NAME" --zone "$INPUT_LOCATION_ZONE" --project "$INPUT_PROJECT_ID"

#submit the workflow
argo submit $INPUT_WORKFLOW_YAML_PATH --name $WORKFLOW_NAME

#emit the outputs
echo "::set-output name=WORKFLOW_URL::$INPUT_ARGO_URL/$WORKFLOW_NAME"