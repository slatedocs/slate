.PHONY: build
build:
	docker build -t tier/documentation -f Dockerfile .
	docker run -it -p 80:80 tier/documentation

aws:
	aws s3api create-bucket --bucket tier-documentation --region eu-central-1  --create-bucket-configuration LocationConstraint=eu-central-1
	aws s3api put-bucket-policy --bucket tier-documentation --policy "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::075108987694:root\"},\"Action\":\"s3:PutObject\",\"Resource\":\"arn:aws:s3:::tier-documentation/stage-AWSLogs/*\"}]}"
	aws s3api put-bucket-policy --bucket tier-documentation --policy "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::075108987694:root\"},\"Action\":\"s3:PutObject\",\"Resource\":\"arn:aws:s3:::tier-documentation/production-AWSLogs/*\"}]}"
