#!/bin/bash
declare -a lambdas=("products-api"
)

for lmb in "${lambdas[@]}"   #  <-- Note: Added "" quotes.
do
  echo "Deploying $lmb ..."  # (i.e. do action / processing of $databaseName here...)
  cd $lmb
  env GOOS=linux GOARCH=amd64 go build -o /tmp/main
  zip -j /tmp/${lmb}.zip /tmp/main
  
  echo "Uploading $lmb to s3 ..."
  aws s3 cp /tmp/${lmb}.zip s3://smalbert-lambdas/
  
  echo "Updating Function Code ..."
  cd ..
  #aws lambda update-function-code --function-name GoFitCompaniesApi \
  #  --s3-bucket gofit-lambda-functions --s3-key ${lambda}.zip
done