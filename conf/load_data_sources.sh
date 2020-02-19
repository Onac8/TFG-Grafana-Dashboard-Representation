#!/bin/bash
for i in data_sources/*; do \
    curl -X "POST" "http://localhost:3000/api/datasources" \
    -H "Content-Type: application/json" \
     --user admin:12341829as \
     --data-binary @$i
done
