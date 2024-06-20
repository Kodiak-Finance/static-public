#!/bin/bash

directory="tokens"

if [ ! -d "src/$directory" ]; then
  echo "Directory src/$directory does not exist."
  exit 1
fi
if [ ! -d "$directory" ]; then
  # Create the directory
  mkdir -p "$directory"
fi

for input_file in "src/$directory"/*.png; 
do
  if [ ! -e "$input_file" ]; then
    echo "No PNG files found in $directory."
    exit 1
  fi
  echo $input_file;

  output_file="${input_file#src/}"

  convert "$input_file" \
      -resize 64x64^ \
      -gravity center \
      -extent 64x64 \
      -background none \
      -alpha set \
      -vignette 0x0 \
      -strip \
      "$output_file"

  input_size=$(stat -c%s "$input_file")
  input_size_kb=$((input_size / 1024))
  output_size=$(stat -c%s "$output_file")
  output_size_kb=$((output_size / 1024))

  echo "Processed $output_file, input size: ${input_size_kb}KB, output size: ${output_size_kb}KB."
done

echo "All images in $directory have been processed."
