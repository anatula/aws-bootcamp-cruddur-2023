## Logging Services

Is a service that enables governance, compliance, operational auditing, and risk auditing of your AWS account.

Cloud Trail logs all API calls (SDK, CLI) between AWS services to:

- detect who did thing:
  - who created this bucket?
  - who spun up that expensive EC2 instance?
- To detect developer misconfiguration
- Detect malicious actors
- Automate responses through the system

Easily identify which users and accounts made the call to AWS eg.

- Where? Source IP address
- When? EventTime
- Who? User, UserAgent
- What? Region, Resource, Action

![cloud_trail_example](../assets/week0/cloud_trail_example.png)

## Cloud watch
Collection of multiple services
"umbrella service" so many things underneath it

- Logs: A centralized place to store your cloud services log data or app's logs
- Metrics: represent a time-ordered set of data points. A variable to monitor
- Events (EventBride) trigger an event based on a condition eg. every hour take a snapshot of server
- Alarms trigger notifications based on metrics
- Dashboard create visualization based on metrics

### CloudWatch Alarms
Monitors a CloudWatch Metric based on a defined threshold
Setting up a billing alarms.

## AWS X-Ray
Is a distributed tracing system. You can use it to pinpoint issues within your microservices. See how data moves from one app to another, how long it took to move, and if it failed to moved forward. 





