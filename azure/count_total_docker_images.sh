#!/bin/bash
REGISTRY=example-registry
REPOS=$(az acr repository list  -n ${REGISTRY} --output tsv)

TOTAL=0
for repo in $REPOS; do
    COUNT=$(az acr repository show -n ${REGISTRY} --repository $repo --output tsv | awk '{print $4}')
    echo $repo: $COUNT
    TOTAL=$(( $TOTAL + $COUNT ))
done

echo TOTAL=$TOTAL
