#!/bin/sh -l

log() {
  echo ">> [mina-action]" $@
}

minaDeploy() {
  log "Running mina $INPUT_ENVIRONMENT $INPUT_COMMAND"
  /usr/local/bundle/bin/mina $INPUT_ENVIRONMENT $INPUT_COMMAND
}

configureSSH() {
  log "Configuring SSH."
  eval `ssh-agent -s`
  echo "${INPUT_SSH_PRIVATE_KEY}" | ssh-add -
}

cleanup() {
  log "Killing ssh agent."
  ssh-agent -k
}
trap cleanup EXIT

log "Starting mina action."
configureSSH
minaDeploy
