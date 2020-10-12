#!/bin/bash

oc delete -f jobmanager-rest-service.yaml
oc delete -f taskmanager-deployment-scala.yaml
oc delete -f jobmanager-deployment-scala.yaml
oc delete -f jobmanager-service.yaml
oc delete -f flink-configuration-configmap.yaml