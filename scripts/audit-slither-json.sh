#!/bin/bash
sh [ -d audits/slither/json ] || mkdir -p audits/slither/json
slither . --json audits/slither/json/audit.json