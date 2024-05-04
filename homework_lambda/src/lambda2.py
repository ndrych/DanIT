import boto3

def lambda_handler(event, context):
    # Initialize the EC2 client
    ec2_client = boto3.client('ec2')
                
    # Get a list of all EC2 instances
    instances = ec2_client.describe_instances()
                           
    # List to store started instance IDs
    started_instance_ids = []

    # Loop through each reservation
    for reservation in instances['Reservations']:
        for instance in reservation['Instances']:
            # Check if instance is stopped and has Owner tag
            if instance['State']['Name'] == 'stopped' and 'Tags' in instance:
                for tag in instance['Tags']:
                    if tag['Key'] == 'Owner' and tag['Value'] == 'natalochka.zvlp@gmail.com':
                        # Start the instance
                        ec2_client.start_instances(InstanceIds=[instance['InstanceId']])
                        # Add instance ID to the list
                        started_instance_ids.append(instance['InstanceId'])
                                                                                                                                                                                                    
    return started_instance_ids
