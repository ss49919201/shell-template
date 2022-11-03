#!/bin/bash

USER=${1}

echo "delete ${USER}"
userdel beats

echo "create ${USER}"
useradd --create-home --shell /bin/bash --password PASSWORD beats
