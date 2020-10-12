#!/bin/bash

oc create -f flink-configuration-configmap.yaml
oc create -f jobmanager-service.yaml
oc create -f jobmanager-deployment-rmlstreamer.yaml
oc create -f taskmanager-deployment-rmlstreamer.yaml
oc create -f jobmanager-rest-service.yaml