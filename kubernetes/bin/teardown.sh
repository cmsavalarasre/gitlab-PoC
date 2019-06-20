#!/usr/bin/env bash

set -ex pipefail

if [[ -z "$KUBE_NAMESPACE" ]]; then
    echo "Must provide KUBE_NAMESPACE in environment" 1>&2
    exit 1
fi

bin_dir="$( cd "$( dirname "$0" )" && pwd )"
k8s_dir="$(dirname "$bin_dir")"

if [ "$KUBE_NAMESPACE" == "hello-whale-production" ]; then
  echo "Deleting namespace: ${KUBE_NAMESPACE}..."
  kubectl delete namespace "${KUBE_NAMESPACE}"
else
  echo "${KUBE_NAMESPACE} cannot be tore down this way..."
fi

