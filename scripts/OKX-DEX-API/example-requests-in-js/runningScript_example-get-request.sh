echo "Load the environment variables from the .env file..."
source ./scripts/OKX-DEX-API/.env
#source ../../../.env
#. ./.env

echo "Run the script file of the example-get-request.js"
node ./scripts/OKX-DEX-API/example-requests/example-get-request.js