#!/bin/sh

# Loop through all environment variables
for var in $(printenv | grep '^ETV_'); do
  # Extract the value of the variable and split it into key and path
  key=$(echo "$var" | cut -d '=' -f 2)
  path=$(echo "$var" | cut -d '=' -f 3-)

  # Check if we successfully parsed key and path
  if [ -z "$key" ] || [ -z "$path" ]; then
    echo "Invalid format for $var: $key_path"
    continue
  fi

  # Get the value of the environment variable named by $key, decode it, and write to $path
  encoded_value=$(printenv "$key")

  if [ -n "$encoded_value" ]; then
    echo "$encoded_value" | base64 -d > "$path"
    echo "Wrote decoded value of $key to $path"
  else
    echo "Environment variable $key not found or empty"
  fi
done

