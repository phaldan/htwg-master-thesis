#!/bin/bash

files=$(find api/common/src/main/scala api/generatorControl/src/main/scala api/images/filter/scala/src/main/scala api/images/metamodel/release/src/main/scala api/images/generator/template/src/main/scala api/images/generator/basic/src/main/scala api/images/generator/file/src/main/scala api/images/generator/remote/src/main/scala api/images/generator/specific/src/main/scala api/persistence/src/main/scala api/server/app -type f -name "*.scala")

for file in $files; do # Not recommended, will break on whitespace
  count=$(grep "$1" "${file}" | grep -v '* ' | grep -v '|' | wc -l)
  echo "${file};${count}"
done
