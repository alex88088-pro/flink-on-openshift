#!/bin/bash

oc create -f flink-configuration-configmap.yaml
oc create -f jobmanager-service.yaml
oc create -f jobmanager-deployment.yaml
oc create -f taskmanager-deployment.yaml
oc create -f jobmanager-rest-service.yaml