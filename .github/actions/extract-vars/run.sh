#!/usr/bin/bash

set -euo pipefail
set -x

mkdir -p ${OUTPUT_DIR}/extracted-variants

df -h


clinvar-this data extract-vars \
    ${OUTPUT_DIR}/convert-clinvar/clinvar-full-release.jsonl.gz \
    ${OUTPUT_DIR}/extracted-variants


cat >${OUTPUT_DIR}/extracted-variants/spec.yaml <<EOF
dc.identifier: clinvar-this/clinvar-extracted-variants-${RELEASE_NAME/-/}+$CLINVAR_THIS_VERSION
dc.title: clinvar-this gene-to-phenotype links JSONL file
dc.creator: NCBI ClinVar Team
dc.contributor:
  - VarFish Development Team
dc.format: application/x-json-lines
dc.date: $(date +%Y%m%d)
x-version: ${RELEASE_NAME/-/}+$CLINVAR_THIS_VERSION
dc.description: |
  JSONL file with extract variants from ClinVar.
dc.source:
  - PMID:32461654
  - https://gnomad.broadinstitute.org/
  - https://github.com/bihealth/clinvar-this
  - https://github.com/bihealth/clinvar-data-jsonl
x-created-from:
  - name: ClinVar weekly release
    version: $RELEASE_NAME
EOF


df -h
