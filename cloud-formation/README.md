First, create the stack lambdas-bucket-stack.yml
This will output the name of the s3 bucket where you will deploy your lambdas.

Upload all the lambdas to s3

Create Cognito user pool
This will output the name of the user pool that you will use in the rest-api.

Next, create de restApi-stack.yml which references the lambdas-bucket-stack