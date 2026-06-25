import json
import boto3
import uuid
import os
from datetime import datetime

s3 = boto3.client('s3')
BUCKET_NAME = os.environ['BUCKET_NAME']

def lambda_handler(event, context):
    # Generate a unique filename
    timestamp = datetime.now().strftime('%Y-%m-%d-%H-%M-%S')
    file_name = f"payloads/{timestamp}_{uuid.uuid4()}.json"
    
    # Get the body from the request
    payload = event.get('body', '{}')
    
    # Save to S3
    s3.put_object(
        Bucket=BUCKET_NAME,
        Key=file_name,
        Body=payload,
        ContentType='application/json'
    )
    
    # Return a success response
    return {
        'statusCode': 200,
        'body': json.dumps({'message': 'Payload captured successfully', 'file': file_name})
    }

