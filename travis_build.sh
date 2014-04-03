#!/bin/bash

set -xe

warn() {
  tput setaf 1
  echo "[ERROR] Received $1"
  tput sgr0
  exit 1
}

trap "warn SIGINT" SIGINT
trap "warn SIGTERM" SIGTERM
trap "warn SIGHUP" SIGHUP

grunt karma:travis

