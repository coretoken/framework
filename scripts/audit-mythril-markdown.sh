#!/bin/bash
[ -d audits/mythril/markdown ] || mkdir -p audits/mythril/markdown
for filename in contracts/*.sol; do
  myth -xo markdown "$filename" > "audits/mythril/markdown/$(basename "$filename" .sol).md"
done