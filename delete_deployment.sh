#!/bin/bash

oc delete -f flink-configuration-configmap.yaml
oc delete -f jobmanager-service.yaml
oc delete -f jobmanager-deployment.yaml
oc delete -f taskmanager-deployment.yaml
oc delete -f jobmanager-rest-service.yaml