#!/bin/bash

set -eo pipefail

echo "--- :package: Push docker alpine latest to registry"

docker pull alpine
docker tag alpine packages.buildkite.com/phantom-press/whaleways/alpine
buildkite-agent oidc request-token --audience "https://packages.buildkite.com/phantom-press/whaleways" --lifetime 300 | docker login packages.buildkite.com/phantom-press/whaleways --username buildkite --password-stdin
docker push packages.buildkite.com/phantom-press/whaleways/alpine:latest
