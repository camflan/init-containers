#!/bin/sh

if [ -z "$SOURCE_FILES" ] || [ -z "$DESTINATION_DIR" ]; then
 echo "Both SOURCE_FILES and DESTINATION_DIR must be set"
 exit 1
fi

mkdir -p "$DESTINATION_DIR"

for file in $(echo "$SOURCE_FILES" | tr ',' ' '); do
 file=$(echo "$file" | xargs)

 if [ ! -f "$file" ]; then
 echo "File $file not found"
 continue
 fi

 envsubst < "$file" > "$DESTINATION_DIR/$(basename "$file")"
 echo "Processed $file and wrote to $DESTINATION_DIR/$(basename "$file")"
done

