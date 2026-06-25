# save function
FUNCTION_NAME="CapturePayloadFunction"
BUCKET_NAME="my-api-payload-capture"
ROLE_NAME="MyLambdaExecutionRole"
ACCOUNT_ID="123456789012"
ROLE_ARN="arn:aws:iam::${ACCOUNT_ID}:role/${ROLE_NAME}"

mkdir ./tmp
cp ./save.py ./tmp/lambda_function.py
zip ./tmp/function.zip lambda_function.py

aws lambda create-function \
	--function-name ${FUNCTION_NAME} \
	--runtime python3.12 \
	--role ${ROLE_ARN} \
	--handler lambda_function.lambda_handler \
	--zip-file fileb://tmp/function.zip \
	--environment Variables={BUCKET_NAME=${BUCKET_NAME}}

rm -rf ./tmp

# load function
FUNCTION_NAME="LoadPayloadFunction"

mkdir ./tmp
cp ./load.py ./tmp/lambda_function.py
zip ./tmp/function.zip lambda_function.py

aws lambda create-function \
	--function-name ${FUNCTION_NAME} \
	--runtime python3.12 \
	--role ${ROLE_ARN} \
	--handler lambda_function.lambda_handler \
	--zip-file fileb://tmp/function.zip \
	--environment Variables={BUCKET_NAME=${BUCKET_NAME}}

rm -rf ./tmp

# roles

aws iam put-role-policy \
	--role-name ${ROLE_NAME} \
	--policy-name LambdaS3CapturePolicy \
	--policy-document file://lambda_policy.json

aws iam create-role \
	--role-name ${ROLE_NAME} \
	--assume-role-policy-document file://trust-policy.json

# Add basic logging permissions so the function can report errors
aws iam attach-role-policy \
	--role-name ${ROLE_NAME} \
	--policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole
