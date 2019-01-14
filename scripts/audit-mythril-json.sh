#!/bin/bash
[ -d audits/mythril/json ] || mkdir -p audits/mythril/json
for filename in contracts/*.sol; do
  myth -xo json "$filename" > "audits/mythril/json/$(basename "$filename" .sol).json"
done