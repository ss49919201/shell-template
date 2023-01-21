#!/bin/bash

if !(type air > /dev/null 2>&1); then
	echo "Install air ..."
	go install github.com/cosmtrek/air@latest
fi
