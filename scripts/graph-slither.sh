#!/bin/bash
[ -d graphs/slither/dot ] || mkdir -p graphs/slither/dot
for filename in contracts/*.sol; do
  slither "$filename" --printers contract-summary > "graphs/slither/dot/$(basename "$filename" .sol).dot"
done
[ -d graphs/slither/images ] || mkdir -p graphs/slither/images
for filename in graphs/slither/dot/*.dot; do
  dot "$filename" -Tpng -o "graphs/slither/images/$(basename "$filename" .dot).png"
done