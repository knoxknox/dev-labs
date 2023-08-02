# localstack

This project is an example how to use localstack in development.<br/>
Next services were included to show localstack abilities: `s3`, `secretsmanager`.

# Usage

Start localstack using next commands:
- run `dc start` to start localstack container;
- run `http 0.0.0.0:4566/health` to check health status;
- run `dc aws-local-localstack-1` to attach to running container;
- run `aws configure` to configure aws profile for aws-cli usage inside container;

# Configuration

Application should be configured to use localstack endpoint:

```
Aws::S3::Client.new(endpoint: 'http://localhost:4566')
Aws::SecretsManager::Client.new(endpoint: 'http://localhost:4566')
```

# AWS S3 client usage

Documentation:
- https://docs.aws.amazon.com/cli/latest/reference/s3/index.html
- https://docs.aws.amazon.com/cli/latest/reference/s3api/index.html

Client commands:
- `aws --endpoint-url http://localhost:4566 s3api list-buckets`
- `aws --endpoint-url=http://localhost:4566 s3 mb s3://test-bucket`
- `aws --endpoint-url http://localhost:4566 s3api delete-bucket --bucket test-bucket`

# AWS SecretsManager client usage

Documentation:
- https://docs.aws.amazon.com/cli/latest/reference/secretsmanager/index.html

Client commands:
- `aws --endpoint-url http://localhost:4566 secretsmanager list-secrets`
- `aws --endpoint-url http://localhost:4566 secretsmanager get-secret-value --secret-id test`
- `aws --endpoint-url=http://localhost:4566 secretsmanager create-secret --name test --secret-string 'secret'`
- `aws --endpoint-url http://localhost:4566 secretsmanager delete-secret --secret-id test --force-delete-without-recovery`
