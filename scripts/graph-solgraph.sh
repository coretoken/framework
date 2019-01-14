#!/bin/bash
[ -d graphs/solgraph/dot ] || mkdir -p graphs/solgraph/dot
for filename in contracts/*.sol; do
  solgraph "$filename" > "graphs/solgraph/dot/$(basename "$filename" .sol).dot"
done
[ -d graphs/solgraph/images ] || mkdir -p graphs/solgraph/images
for filename in graphs/solgraph/dot/*.dot; do
  dot "$filename" -Tpng -o "graphs/solgraph/images/$(basename "$filename" .dot).png"
done