See the [DSRI documentation](https://maastrichtu-ids.github.io/dsri-documentation) to deploy it on the Data Science Research Infrastructure (OpenShift cluster at [Maastricht University](https://maastrichtuniversity.nl)).

Deployment written from the [official Flink Kubernetes documentation](https://ci.apache.org/projects/flink/flink-docs-stable/ops/deployment/kubernetes.html). Images built from [apache/flink](https://github.com/apache/flink).

In this deployment a PVC storage has been mounted on `/mnt` (inside the pod). 

⚠️ **Change the PVC name in  before creating the deployment**

Change it at the end of files `jobmanager-deployment.yaml` and `taskmanager-deployment.yaml`

Script to deploy Flink Job and Task managers in the current project:

```bash
# Login to the OpenShift cluster
oc login https://<openshift-url>:8443 --token=<openshift-token>

# Go to the project where you want to deploy Apache Flink
oc project my-project
```

## Deploy

Deploy 1 Job manager and 2 Task manager pods

```bash
./create_deployment.sh
```

> Flink home folder inside the pods is `/opt/flink`

> PVC shared in `/mnt` inside the pods.

## Connect to pod

Use this command to get the Flink Jobmanager **Pod ID** and copy files to the pod.

```bash
oc get pod --selector app=flink --selector component=jobmanager --no-headers -o=custom-columns=NAME:.metadata.name

# Example creating the workspace folder and copying the RMLStreamer.jar to the pod
oc exec <pod_id> -- mkdir -p /mnt/workspace/resources
oc cp folder-to-copy/ <pod_id>:/mnt/
```

## Delete

Delete the deployed services:

```bash
./delete_deployment.sh
```

## Details

Details of create command:

```bash
oc create -f flink-configuration-configmap.yaml
oc create -f jobmanager-service.yaml
oc create -f jobmanager-deployment.yaml
oc create -f taskmanager-deployment.yaml
oc create -f jobmanager-rest-service.yaml
```

