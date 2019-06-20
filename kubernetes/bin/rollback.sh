#!/usr/bin/env bash

set -ex pipefail

if [[ -z "$KUBE_NAMESPACE" ]]; then
    echo "Must provide KUBE_NAMESPACE in environment" 1>&2
    exit 1
fi

kubectl -n "${KUBE_NAMESPACE}" rollout undo deployment/hello-whale

