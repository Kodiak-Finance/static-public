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
if [ ! -d "$directory/32" ]; then
  # Create the directory for 32x32 images
  mkdir -p "$directory/32"
fi
if [ ! -d "$directory/64" ]; then
  # Create the directory for 64x64 images
  mkdir -p "$directory/64"
fi

process_image() {
  local input_file="$1"
  local output_file="$2"
  local size="$3"

  convert "$input_file" \
      -resize "${size}x${size}^" \
      -gravity center \
      -extent "${size}x${size}" \
      -background none \
      -alpha set \
      -vignette 0x0 \
      -strip \
      "$output_file"

  if [ $? -ne 0 ]; then
    echo "Error processing $input_file"
    exit 1
  fi
}

for input_file in "src/$directory"/*.png; 
do
  if [ ! -e "$input_file" ]; then
    echo "No PNG files found in $directory."
    exit 1
  fi
  output_file="${input_file#src/}"

  # Process for 64x64 size
  process_image "$input_file" "$output_file" 128

  input_size=$(stat -c%s "$input_file")
  input_size_kb=$((input_size / 1024))
  output_size=$(stat -c%s "$output_file")
  output_size_kb=$((output_size / 1024))

  echo "Processed $output_file, input size: ${input_size_kb}KB, output size: ${output_size_kb}KB."

  # Process for 32x32 size
  output_file_32="$directory/32/${input_file#src/$directory/}"
  process_image "$input_file" "$output_file_32" 32

  output_size_32=$(stat -c%s "$output_file_32")
  output_size_kb_32=$((output_size_32 / 1024))

  echo "Processed $output_file_32, input size: ${input_size_kb}KB, output size: ${output_size_kb_32}KB."

  # Process for 64x64 size
  output_file_64="$directory/64/${input_file#src/$directory/}"
  process_image "$input_file" "$output_file_64" 64

  output_size_64=$(stat -c%s "$output_file_64")
  output_size_kb_64=$((output_size_64 / 1024))

  echo "Processed $output_file_64, input size: ${input_size_kb}KB, output size: ${output_size_kb_64}KB."
done

echo "All images in $directory have been processed."
