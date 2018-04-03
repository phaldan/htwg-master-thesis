#!/bin/bash

files=$(find api/common/src/main/scala api/generatorControl/src/main/scala api/images/filter/src/main/scala api/images/metaModelRelease/src/main/scala api/images/generator/src/main/scala api/persistence/src/main/scala api/server/app -type f -name "*.scala")

for file in $files; do # Not recommended, will break on whitespace
  count=$(grep "$1" "${file}" | grep -v '* ' | grep -v '|' | wc -l)
  echo "${file};${count}"
done
