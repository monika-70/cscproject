import json
import boto3
import os

sns_client = boto3.client('sns')

def lambda_handler(event, context):
    # Extract data from the event
    short_url = event['shortUrl']
    description = event['description']
    
    # Send message containing the shortened URL and description
    send_message(short_url, description)
    
    return {
        'statusCode': 200,
        'body': json.dumps('Message sent successfully!')
    }

def send_message(short_url, description):
    topic_arn = 'arn:aws:sns:us-east-1:344625889477:cscproject'  # Replace with your SNS topic ARN
    message = f'Short URL: {short_url}\nDescription: {description}'
    
    sns_client.publish(
        TopicArn=topic_arn,
        Message=message
    )
