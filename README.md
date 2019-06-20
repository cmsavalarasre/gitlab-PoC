# ArchimedesPoC
Avalara CI/CD Pipe Line PoC

- [ The JIRA Issue](https://jira.avalara.com/browse/SAASOPS-23455)

- Implement the Orbs patterns in our CI pipeline.
- Implement the TLDR "The lightweight docker runtime"
- Implement Argo ' an open source container-native workflow engine' along with gitlab
- Integrate slack notifications for each stage.
- Implement jsonnet libraries to create templates for the gitlab ci/cd pipeline.


# Introduction
  
This is a template for go-micro services deployment using gitlab and CircleCI orbs pattern. 

# Reference links

- [ The Jen of Python](https://www.python.org/dev/peps/pep-0020/)
- [ GitLab CI/CD Pipeline Configuration Reference ](https://docs.gitlab.com/ee/ci/yaml/)
- [ Gitlab Documents ](docs.gitlab.com)
- [ Circle CI orbs Patterns ]( https://circleci.com/orbs/registry/orb/anchore/anchore-engine)
- [ Slack notification sending resource](https://github.com/cloudfoundry-community/slack-notification-resource)
- [ Twelve Factor App](https://12factor.net/)
- [ A data templating language for app and tool developers](https://jsonnet.org/)
- [ Agro WorkFlow Templates](https://github.com/argoproj/argo/tree/master/examples)
- [ jsonnet ](https://jsonnet.org/)
- [ Kube Libsonnet ](https://github.com/bitnami-labs/kube-libsonnet/blob/master/kube.libsonnet)
- [ Libsonnet ](https://github.com/bitnami-labs/kube-libsonnet/tree/master/examples)
- [ Ruby openshift example ]( https://gitlab.com/gitlab-examples/ruby-openshift-example/blob/master/.gitlab-ci.yml)
- [ CI Project Page ]( https://wiki.avalara.com/display/SAASOPS/Continuous+Integration+and+Delivery)
- [GitLab CI Documentation](https://docs.gitlab.com/ee/ci/)
- [Go Micro Overview](https://micro.mu/docs/go-micro.html)
- [Go Micro Toolkit](https://micro.mu/docs/go-micro.html)

# Getting started

First thing to do is clone this repo with your project path:



## What's contained in this project

- main.go - is the main definition of the service, handler and client

## Dependencies

- [ Golang ](https://golang.org/)

## Run Service

```shell
Bash script
Usage: ./avapoc.sh ImagaeName

Manual Steps

${DOCKER} build -t ImageName .

${DOCKER} run -i -t --rm -p 8080:8080 ${1}

```
