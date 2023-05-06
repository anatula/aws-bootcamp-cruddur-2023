# Week 5 — DynamoDB and Serverless Caching

Install `boto3` library

`pip install -r requirements.txt`

Do a 
`docker-compose up`

We'll start using dynamo db locally, to avoid consuming a lot of Gitpod credits.

Create table dynamo db, we using the sdk

Using python 3, since it's installed by default in mac:

Installed boto3 using:
`pip3 install -r requirements.txt`

`docker network create dynamo-local-network`

```
docker run -d -p 8000:8000 --network=dynamo-local-network --name dynamo-local amazon/dynamodb-local -jar DynamoDBLocal.jar -sharedDb
```

After just: `docker start dynamo-local`

To connect to local dynamodb: 
```
aws dynamodb list-tables --endpoint-url http://localhost:800
Need 3 envs:
export AWS_ACCESS_KEY_ID=dummy
export AWS_SECRET_ACCESS_KEY=dummy
export AWS_DEFAULT_REGION=eu-central-1
```
### Boto3 Resource vs Client

Clients provide the low-level interface as closely with service APIs. Which means, all service operations will be supported by clients. Whereas, the Resources provide a hig-level interface which means differently than the raw low-level calls provided by Clients.

### Helpful links

- [dynamodb-with-python-boto3](https://iamvickyav.medium.com/aws-dynamodb-with-python-boto3-part-1-intro-to-dynamodb-local-installation-b168d9d762d5)


