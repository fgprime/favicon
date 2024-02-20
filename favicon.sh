#!/usr/bin/env bash

# Output directory
output_dir="target"

# Input image file
input_image_small="./source/smallOutput.png"

echo "Converting favicon.ico"
convert $input_image_small  -bordercolor white -border 0 \
      \( -clone 0 -resize 48x48 \) \
      -delete 0 -alpha off -colors 256 $output_dir/favicon.ico

# Add different sizes to favicon.ico
# convert $input_image_small  -bordercolor white -border 0 \
#       \( -clone 0 -resize 64x64 \) \
#       \( -clone 0 -resize 48x48 \) \
#       \( -clone 0 -resize 32x32 \) \
#       \( -clone 0 -resize 16x16 \) \
#       -delete 0 -alpha off -colors 256 $output_dir/favicon.ico

# Input image file
input_image_large="./source/largeOutput.png"

# List of resolutions
resolutions=( "57x57" "60x60" "72x72" "76x76" "114x114" "120x120" "144x144" "152x152" "180x180")

# Output base name
output_basename="apple-icon-"
output_filetype="png"


# Check if output directory exists, if not, create it
if [ ! -d "$output_dir" ]; then
  mkdir "$output_dir"
fi

# Loop through resolutions and convert the image
for resolution in "${resolutions[@]}"; do
  output_file="$output_dir/$output_basename${resolution}.$output_filetype"
  echo "Converting to $resolution - Output: $output_file"
  convert "$input_image_large" -resize "$resolution" "$output_file"
done

echo "Converting to 192x192 - Output: $output_dir/android-icon-192x192.png"
convert $input_image_large -resize 192x192 -alpha off $output_dir/android-icon-192x192.png


echo "Converting to 512x512 - Output: $output_dir/android-icon-512x512.png"
convert $input_image_large -resize 512x512 -alpha off $output_dir/android-icon-512x512.png


echo "Converting to 16x16 - Output: $output_dir/favicon-16x16.png"
convert $input_image_small -resize 16x16 -alpha off $output_dir/favicon-16x16.png


echo "Converting to 32x32 - Output: $output_dir/favicon-32x32.png"
convert $input_image_small -resize 32x32 -alpha off $output_dir/favicon-32x32.png


echo "Converting to 96x96 - Output: $output_dir/favicon-96x96.png"
convert $input_image_large -resize 96x96 -alpha off $output_dir/favicon-96x96.png
