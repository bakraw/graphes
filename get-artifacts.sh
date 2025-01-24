#!/bin/bash

curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $(cat ../token.gh)" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/bakraw/graphes/actions/artifacts \
  > gh-artifacts.json

ID=$(jq ".artifacts[0].id" gh-artifacts.json)
echo "ID=$ID"

curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $(cat ../token.gh)" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  --output artifact.zip \
  https://api.github.com/repos/bakraw/graphes/actions/artifacts/$ID/zip
