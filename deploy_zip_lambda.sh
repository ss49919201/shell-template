#!/bin/bash -x

set -e

AWS_PROFILE=$1
LAMBDA_FUNCTION=$2

# スクリプトが配置されているディレクトリへ移動
function changeDir() {
	cd $(dirname $0)
}

function build() {
	GOOS=linux GOARCH=amd64 go build -o main main.go
}

function zipBinary() {
	zip main.zip main
}

function upload() {
	aws lambda update-function-code \
	--region ap-northeast-1 \
	--profile developer \
	--function-name $LAMBDA_FUNCTION \
	--zip-file fileb://main.zip
}

function cleanUp() {
	rm main.zip main
}

changeDir
build
zipBinary
upload
cleanUp
