#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5ea8030851543d00196ae33a/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5ea8030851543d00196ae33a
curl -s -X POST https://api.stackbit.com/project/5ea8030851543d00196ae33a/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5ea8030851543d00196ae33a/webhook/build/publish > /dev/null
