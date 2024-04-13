#!/usr/bin/env bash

# Output directory
output_dir="target"

# Input image file
input_image_small="./source/smallOutput.png"

echo "Converting favicon.ico"
convert $input_image_small -bordercolor white -border 0 \
	\( -clone 0 -resize 48x48 \) \
	-delete 0 -alpha off -colors 256 $output_dir/favicon.ico

# Add different sizes to favicon.ico
convert $input_image_small -bordercolor white -border 0 \
	\( -clone 0 -resize 64x64 \) \
	\( -clone 0 -resize 48x48 \) \
	\( -clone 0 -resize 32x32 \) \
	\( -clone 0 -resize 16x16 \) \
	-delete 0 -alpha off -colors 256 $output_dir/favicon.multi.ico
