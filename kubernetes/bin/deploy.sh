#!/usr/bin/env bash

set -ex pipefail

if [[ -z "$KUBE_NAMESPACE" ]]; then
    echo "Must provide KUBE_NAMESPACE in environment" 1>&2
    exit 1
fi

if [[ -z "$ENVIRONMENT_NAME" ]]; then
    echo "Must provide ENVIRONMENT_NAME in environment" 1>&2
    exit 1
fi

if [[ -z "$CI_COMMIT_SHA" ]]; then
    echo "Must provide CI_COMMIT_SHA in environment" 1>&2
    exit 1
fi

if [[ "$LOCAL_DEPLOY" != "true" ]]; then
    if [[ -z "$SRE_READONLY_USERNAME" ]]; then
        echo "Must provide SRE_READONLY_USERNAME in environment" 1>&2
        exit 1
    fi

    if [[ -z "$SRE_READONLY_TOKEN" ]]; then
        echo "Must provide SRE_READONLY_TOKEN in environment" 1>&2
        exit 1
    fi
fi

bin_dir="$( cd "$( dirname "$0" )" && pwd )"
k8s_dir="$( dirname "$bin_dir" )"

deployment_file="${k8s_dir}/deployment.yaml"

gomplate -f "${k8s_dir}/deployment.gtmpl.yaml" > "${deployment_file}"

set +e
ns=$(kubectl get namespace ${KUBE_NAMESPACE} --no-headers --output=go-template={{.metadata.name}} 2>/dev/null)
set -e
if [ -z "${ns}" ]; then
    kubectl create namespace "${KUBE_NAMESPACE}"
fi

if [[ "$LOCAL_DEPLOY" != "true" ]]; then
    set +e
    regcred=`kubectl -n ${KUBE_NAMESPACE} get secret regcred --no-headers --output=go-template={{.metadata.name}} 2>/dev/null`
    set -e
    if [ -z "${regcred}" ]; then
        kubectl -n "${KUBE_NAMESPACE}" create secret docker-registry regcred \
            --docker-server=registry-demo.cloud.avalara.io \
            --docker-username="$SRE_READONLY_USERNAME" \
            --docker-password="$SRE_READONLY_TOKEN" \
            --docker-email="sre-readonly@avalara.com"
    fi
fi

kubectl apply -f "${deployment_file}"

kubectl -n "${KUBE_NAMESPACE}" rollout status deployment/hello-whale --timeout=60s

