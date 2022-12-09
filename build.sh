#!/bin/bash

pushd backend && ./mvnw clean package && popd || exit
pushd frontend && npm run build && popd || exit

docker build . -t javanreact

rm -rf ./backend/target
rm -rf ./frontend/build
