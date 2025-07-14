#echo "Load the environment variables from the .env file..."
#source ../../.env
#. ./.env

echo "Compile the Smart Contracts for the zktls-integration-with-okx-dex-api circuit (ZkTLSIntegrationsProofVerifier.sol)"
npx hardhat compile

echo "Run the test of the Smart Contracts for the zktls-integration-with-okx-dex-api circuit (ZkTLSIntegrationsProofVerifier.sol)"
npx hardhat test ./circuits/zktls-integration-with-okx-dex-api/ZkTLSIntegrationsProofVerifier.test.ts
#npx hardhat test ./test/MyContract.test.ts --network localhost

echo "Remove the Nargo.toml file in the ./noir directory"
rm -rf ./noir/Nargo.toml

echo "Remove the ./target directory in the ./noir directory"
rm -rf ./noir/target