#! /bin/sh
# Convenience script to aid in quick rebuilding of golang binaries
set -x
TOP_LEVEL=$(git rev-parse --show-toplevel)
NAME="durable_task_monitor"
RESFOLDER="${TOP_LEVEL}/src/main/resources/org/jenkinsci/plugins/durabletask"
rm -rf ${RESFOLDER}/${NAME}_*
env CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -a -o ${NAME}_DARWIN64
env CGO_ENABLED=0 GOOS=darwin GOARCH=386 go build -a -o ${NAME}_DARWIN32
env CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o ${NAME}_UNIX64
env CGO_ENABLED=0 GOOS=linux GOARCH=386 go build -a -o ${NAME}_UNIX32
mv ${NAME}_* ${RESFOLDER}/.
