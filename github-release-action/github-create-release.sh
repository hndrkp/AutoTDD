#!/bin/bash

# ARGUMENTS
#	TAG, TITLE, TARGET, DESCRIPTION, FILE, CONTENT_TYPE

set -e
set -o pipefail

# Ensure that the TAG is set
if [[ -z "$TAG" ]]; then
  echo "TAG env variable not set."
  exit 1
fi

# Ensure that the TITLE is set
if [[ -z "$TITLE" ]]; then
  echo "TITLE env variable not set."
  exit 1
fi

# Ensure that the TARGET is set
if [[ -z "$TARGET" ]]; then
  echo "TARGET env variable not set."
  exit 1
fi

# Ensure that the DESCRIPTION is set
if [[ -z "$TITLE" ]]; then
  echo "DESCRIPTION env variable not set."
  exit 1
fi

# Ensure that the FILE is set
if [[ -z "$FILE" ]]; then
  echo "FILE env variable not set."
  exit 1
fi

# Ensure that the CONTENT_TYPE is set
if [[ -z "$CONTENT_TYPE" ]]; then
  echo "CONTENT_TYPE env variable not set."
  exit 1
fi

# Ensure that the GITHUB_TOKEN secret is included
if [[ -z "$GITHUB_TOKEN" ]]; then
  echo "Set the GITHUB_TOKEN env variable."
  exit 1
fi

curl --request POST \
	  --url "https://api.github.com/repos/$GITHUB_REPOSITORY/releases" \
	  --header "Authorization: Bearer $GITHUB_TOKEN" \
	  --header 'Content-Type: application/json' \
	  --data '{
		  "tag_name": "$TAG",
		  "target_commitish": "$TARGET",
		  "name": "$TITLE",
		  "body": "$DESCRIPTION",
		  "draft": false,
		  "prerelease": false
		}'
		
RELEASE_ID=$(jq --raw-output '.release.id' $GITHUB_EVENT_PATH)
curl \
  -sSL \
  -XPOST \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Content-Length: $(stat -c%s "$FILE")" \
  -H "Content-Type: $CONTENT_TYPE" \
  --upload-file "$FILE" \
  "https://uploads.github.com/repos/${GITHUB_REPOSITORY}/releases/${RELEASE_ID}/assets?name=$(basename $FILE)"
