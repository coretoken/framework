#!/bin/bash
[ -d docs ] || mkdir -p docs
for filename in contracts/*.sol; do
  myth -xo markdown "$filename" > "docs/$(basename "$filename" .sol).md"
done
[ -d docs/images ] || mkdir -p docs/images
CONTRACTS=""
for filename in contracts/*.sol; do
  solgraph "$filename" | dot -Tpng > "docs/images/$(basename "$filename" .sol).png"
  echo "### Graph\n[![$filename](images/$(basename "$filename" .sol).png)](images/$(basename "$filename" .sol).png))" > "docs/$(basename "$filename" .sol).md"
done

INDEX="# Smart Contract\n\n## Smart contract registry\n### Please, select Smart Contract component to review\n---\n"
for filename in docs/*.md; do
  INDEX+="* [$(basename "$filename" .md).sol]($filename)\n"
done
INDEX+="\n##Audits\n"
for audit in audits/*/; do
  INDEX+="* [$(basename "$audit")](../audits/$audit)\n"
done
INDEX+="\n##Graphs\n"
for graph in graphs/*/; do
  INDEX+="* [$(basename "$graph")](../graphs/$graph)\n"
done
INDEX+="\n##Copyright\nCopyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/)."
echo $INDEX > "docs/index.md"