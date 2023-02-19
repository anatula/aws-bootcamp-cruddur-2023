# AWS services :toolbox:

## AWS IAM (Identity and Access Management) :customs: 

- Web service that helps you securely **control access** to AWS resources

- centrally **manage permissions** that control which AWS resources users can access

- control who is *authenticated* (signed in) and *authorized* (has permissions) to use resources.

More on [IAM Intro](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html)


## Amazon SNS (Simple Notification Service) :incoming_envelope:

Managed service that provides **message delivery** from *publishers* to *subscribers*.

 Publishers communicate asynchronously with subscribers by sending messages to a *topic*, which is a logical access point and communication channel.
 
 Clients can subscribe to the SNS topic and receive published messages using a supported endpoint type, such as Amazon Kinesis Data Firehose, Amazon SQS, AWS Lambda, HTTP, email, mobile push notifications, and mobile text messages (SMS).

More on [Getting started with SNS](https://docs.aws.amazon.com/sns/latest/dg/welcome.html)


## Amazon CloudWatch :bar_chart:

- monitors your AWS resources and the applications you run on AWS in real time

- collect and track metrics (variables you can measure for your resources and applications)

- the home page automatically displays metrics about every AWS service you use

- create custom dashboards to display metrics about your custom applications, and display custom collections of metrics that you choose.

- create alarms that watch metrics and send notifications or automatically make changes to the resources you are monitoring when a threshold is breached.


## AWS Organizations :office:

AWS Organizations controls permissions of multiple AWS accounts from a "parent" AWS account. For example, if a company's IT department has an AWS account, and the Finance department has another AWS account, you can do things like limit what services can be used in those accounts, and monitor them for compliance, using AWS Organizations in a "parent" or "root" AWS account.

AWS IAM is used to provide permissions to access the AWS API. You would create IAM accounts within a specific AWS account to provide access to view/create/update/modify resources within that AWS account.


[SO difference IAM vs Organization](https://stackoverflow.com/a/66531573/5425908)

More on [CloudWatch docs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html) 
