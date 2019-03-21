#!/bin/sh

# exit script if anything fails
set -e

# load docker secrets into environment variables for Caddy
export AWS_ACCESS_KEY_ID=$(cat /run/secrets/caddy_aws_access_key_id)
export AWS_SECRET_ACCESS_KEY=$(cat /run/secrets/caddy_aws_secret_access_key)

# Dockerfile RUN command will take the place of this script (PID 1)
#exec "$@"

# removed this from the Dockerfile, since it was already there as an ENTRYPOINT
/bin/caddy "$@"