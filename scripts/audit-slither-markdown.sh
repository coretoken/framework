#!/bin/bash
sh [ -d audits/slither/markdown ] || mkdir -p audits/slither/markdown
slither . > audits/slither/markdown/audit.md