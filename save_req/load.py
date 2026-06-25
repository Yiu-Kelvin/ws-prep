import boto3
import requests

s3 = boto3.client('s3')
BUCKET_NAME = 'my-api-payload-capture'
DESTINATION_URL = 'https://your-new-real-backend.com/api'

def replay_all():
    files = s3.list_objects_v2(Bucket=BUCKET_NAME, Prefix='payloads/')
    for obj in files.get('Contents', []):
        file_content = s3.get_object(Bucket=BUCKET_NAME, Key=obj['Key'])['Body'].read()
        # Replay the data
        requests.post(DESTINATION_URL, data=file_content)
