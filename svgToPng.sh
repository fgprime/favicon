#!/usr/bin/env bash

# Base directory
base_dir="./source"

convert -density 1200 $base_dir/large.svg $base_dir/largeOutput.png
convert -density 1200 $base_dir/small.svg $base_dir/smallOutput.png
