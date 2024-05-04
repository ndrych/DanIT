import boto3

def lambda_handler(event, context):
    # Initialize EC2 client
    ec2_client = boto3.client('ec2')

    # Get list of EC2 instances
    instances = ec2_client.describe_instances()
            
    # List to store stopped instance IDs
    stopped_instance_ids = []

    # Iterate over reservations
    for reservation in instances['Reservations']:
        for instance in reservation['Instances']:
            instance_id = instance['InstanceId']
            instance_state = instance['State']['Name']

            # Check if instance is running and has the "Owner=Your Name" tag
            if instance_state == 'running':
                for tag in instance['Tags']:
                    if tag['Key'] == 'Owner' and tag['Value'] == 'natalochka.zvlp@gmail.com':
                        # Stop the instance
                        ec2_client.stop_instances(InstanceIds=[instance_id])
                        stopped_instance_ids.append(instance_id)
            else:
                stopped_instance_ids.append(instance_id)
    return {
        'stopped_instance_ids': stopped_instance_ids
    }
