See the [DSRI documentation](https://maastrichtu-ids.github.io/dsri-documentation) to deploy it on the Data Science Research Infrastructure (OpenShift cluster at [Maastricht University](https://maastrichtuniversity.nl)).

Deployment written from the [official Flink Kubernetes documentation](https://ci.apache.org/projects/flink/flink-docs-stable/ops/deployment/kubernetes.html). Images built from [apache/flink](https://github.com/apache/flink).

## Add template

You need `anyuid` containers enabled to start this application 🔒

```bash
oc apply -f https://raw.githubusercontent.com/vemonet/flink-on-openshift/master/template-flink.yml
```

> Flink home folder inside the pods is `/opt/flink`

> PVC shared in `/mnt` inside the pods.

## Template for the DSRI

Use this template for the Data Science Research Infrastructure:

```bash
oc apply -f https://raw.githubusercontent.com/vemonet/flink-on-openshift/master/template-flink-dsri.yml
```

## Connect to pod

Use this command to get the Flink Jobmanager **Pod ID** and copy files to the pod.

```bash
oc get pod --selector app=flink --selector component=jobmanager --no-headers -o=custom-columns=NAME:.metadata.name

# Example creating the workspace folder and copying the RMLStreamer.jar to the pod
oc exec <pod_id> -- mkdir -p /mnt/workspace/resources
oc cp folder-to-copy/ <pod_id>:/mnt/
```

## Delete deployment

Delete the deployed services:

```bash
oc delete all,secret,configmaps,serviceaccount,rolebinding --selector app=flink-cluster
```

> Change `flink-cluster` by the name you gave to the application.

