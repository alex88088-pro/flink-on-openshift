#!/bin/bash

oc create -f flink-configuration-configmap.yaml
oc create -f jobmanager-service.yaml
oc create -f jobmanager-deployment-scala.yaml
oc create -f taskmanager-deployment-scala.yaml
oc create -f jobmanager-rest-service.yaml