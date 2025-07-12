#!/bin/bash

# Extract version from Nargo.toml
VERSION=$(grep '^version = ' Nargo.toml | cut -d '"' -f 2)
echo "Circuit version: $VERSION"

# Clean previous build
rm -rf target

echo "Compiling circuit..."
if ! nargo compile; then
    echo "Compilation failed. Exiting..."
    exit 1
fi

echo "Gate count:"
bb gates -b target/zktls_integrations-$VERSION.json | jq '.functions[0].circuit_size'

echo "Generating vk.json to ./target/zktls_integrations/zktls_integrations-$VERSION..."
node -e "const fs = require('fs'); fs.writeFileSync('./target/zktls_integrations-$VERSION/vk.json', JSON.stringify(Array.from(Uint8Array.from(fs.readFileSync('./target/vk/vk')))));"

echo "Generate a Solidity Verifier contract from the vkey..."
bb write_solidity_verifier -k ./target/vk/vk -o ./target/Verifier.sol

echo "Copy a Solidity Verifier contract-generated (Verifier.sol) into the ./contracts/src/circuits/circuit-for-zkemail-2048-bit-dkim/honk-verifier directory"
cp ./target/Verifier.sol ../contracts/circuits/honk-verifier

echo "Rename the Verifier.sol with the honk_vk.sol in the ./contracts/circuits/ultra-verifier directory"
mv ../contracts/circuits/honk-verifier/Verifier.sol ../contracts/circuits/honk-verifier/honk_vk.sol



echo "Done" 