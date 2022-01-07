Requirement : Setup metrics and log file monitoring on AWS EC2 instanced using AWS CloudWatch 

Metrics to Monitor :
	→ CPU | Memory | Disk | Network 
	→ OS Logs : var/log/messages
	→ Application Logs : /var/logs/access_logs

Proposed Solution : 

Ref Architecture : 
https://lucid.app/lucidchart/beae8ea9-88bb-46cd-8db2-3ca0aeed5673/edit?page=0_0#

Hands On Steps  : 
Step 01: Setup 02 EC2 instance with custom new IAM Role and bootstrap Script

BootStrap Script :

IAM Role (Required Policy)
→ AmazonEC2FullSSM	
→ CloudWatchFullAccess
→ AmazonSSMFullAccess


Step 2 : Install CloudWatchAgent using SSM document

Run Command - >  AWS-ConfigureAWSPackage -> AmazonCloudWatchAgent

Step 3: Configure CloudWatch Agent on one of the instance 

/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard

Note : export cloudwatch agent configuration to the parameter store 

Step 4 : Now setup agent directly from SSM 
Run Command > Run Document > AmazonCloudWatch-ManageAgent
Select Parameter Store Configuration while running document 

Step 5 : Validate CloudWatch Metrics and Logs Stats 

Steps for Troubleshooting :

Config Link:
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard

Stop Agent :
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a stop

Start Agent : 
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a start

Troubleshooting:
cat /opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log

Log File Path to Monitor 
/var/log/httpd/access_log
/var/log/messages
/usr/share/tomcat/logs/localhost_access_log*
