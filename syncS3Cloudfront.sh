#!/bin/bash

source_path=$1
profile=$2
bucket_name=$3
distribution_id=$4

# Check if path is suplied
if [ -z "$source_path" ]; then
	echo "Error: Please provide location of the source code. Enter '.' for current directory."
	exit 0;
fi

if [ -z "$profile" ]; then
	echo "Error: AWS Profile is reqquired."
	exit 0;
fi

if [ -z "$bucket_name" ]; then
	echo "Error: S3 bucket is required."
	exit 0;
fi

if [ -d "$source_path" ]; then

	if [ $source_path == "." ]; then
		echo "Source Directory: " $(pwd)
	else
		echo "Source Directory: " $source_path
	fi
    
else
	echo $source_path "does not exist.";
	exit 1
fi

 
# Check if AWS CLI is installed
if which aws &> /dev/null; then
    echo "Set AWS Profile to "$profile
	export AWS_PROFILE=$profile
	echo "S3 sync..."
	aws s3 sync $source_path s3://$bucket_name --exclude '.git/*'
	 
	if [ -z "$distribution_id" ]; then 
		echo "No CloudFront ID provided"
	else
		echo "CloudFront invalidation..."
		aws cloudfront create-invalidation --distribution-id $distribution_id --paths "/*"
	fi

else
	echo "Error: aws cli is not installed."
    exit 2
fi