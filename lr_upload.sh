#!/usr/bin/env bash

# Defaults
LINT="true"
UPLOAD_CMD="luarocks upload"

[ -z "${PLUGIN_ROCKSPEC}" ] && "Path to .rockspec needed!" && exit 1

[ -z "${PLUGIN_APIKEY}" ] && "API key needed for upload!" && exit 1

[ ! -z "${PLUGIN_LINT}" ] && LINT=${PLUGIN_LINT}

[ "${PLUGIN_SKIPPACK}" = "true" ] && UPLOAD_CMD="${UPLOAD_CMD} --skip-pack"

[ "${PLUGIN_FORCE}" = "true" ] && UPLOAD_CMD="${UPLOAD_CMD} --force"

UPLOAD_CMD="${UPLOAD_CMD} --api-key=${PLUGIN_APIKEY} ${PLUGIN_ROCKSPEC}"

if [ "${LINT}" = "true" ]; then
    echo "$ luarocks lint: START"
    err=$( (luarocks lint "${PLUGIN_ROCKSPEC}") 2>&1)

    if [ ${?} -eq 0 ]; then
        echo "$ luarocks lint: OK"
    else
        echo "$ luarocks lint: FAILED"
        echo "$ ERROR: ${err}"
        exit 1
    fi
fi

echo "$ luarocks upload: START"
${UPLOAD_CMD}