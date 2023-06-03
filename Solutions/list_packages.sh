#!/bin/bash

output_file="package_report.txt"

dpkg-query -f '${Package}\t${Version}\n' -W > "$output_file"

echo "Package report generated. Saved to "$output_file"."
