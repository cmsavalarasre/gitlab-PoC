#!/bin/bash

export GO=`which go`
export DOCKER=`which docker`
export KUBECTL=`which kubectl`
export CURL=`which curl`

if [ "$#" -ne 1 ]; then
   echo "Usage: $0 ImagaeName" >&2
   exit 1
fi

# Run Unit Tests 

${CURL} -X POST -H 'Content-type: applicaon/json' --data '{"text":" Running Pre Tests !"}' https://hooks.slack.com/services/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

export TEST_RESULT=`"${GO}" test -v .`


${CURL} -X POST -H 'Content-type: applicaon/json' --data-binary '{"text":"'"${TEST_RESULT}"'"}' https://hooks.slack.com/services/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

# Build images

${CURL} -X POST -H 'Content-type: applicaon/json' --data '{"text":" Building Docker Image !"}' https://hooks.slack.com/services/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
${DOCKER} build -t ${1} .


${CURL} -X POST -H 'Content-type: applicaon/json' --data '{"text":" Starting docker container !"}' https://hooks.slack.com/services/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
${DOCKER} run -i -t --rm -p 8080:8080 ${1}
 
