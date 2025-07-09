echo "Load the environment variables from the .env file..."
source ./scripts/OKX-DEX-API/.env
#source ../../../.env
#. ./.env

echo "Run the script file of the example-get-request.ts"
npx ts-node ./scripts/OKX-DEX-API/okx-dex-sdk-integrations/okx-dex-sdk-api-request-sample.ts