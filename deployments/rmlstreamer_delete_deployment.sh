#!/bin/bash

oc delete -f jobmanager-rest-service.yaml
oc delete -f taskmanager-deployment-rmlstreamer.yaml
oc delete -f jobmanager-deployment-rmlstreamer.yaml
oc delete -f jobmanager-service.yaml
oc delete -f flink-configuration-configmap.yaml