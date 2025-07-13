#echo "Load the environment variables from the .env file..."
#source ../../.env
#. ./.env

echo "Compile the Smart Contracts (MyContract.sol)"
npx hardhat compile

echo "Run the test of the Smart Contracts (MyContract.sol)"
npx hardhat test ./test/MyContract.test.ts
#npx hardhat test ./test/MyContract.test.ts --network localhost

echo "Remove the Nargo.toml file in the ./noir directory"
rm -rf ./noir/Nargo.toml