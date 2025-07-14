import { expect } from "chai";
import hre, { ethers } from "hardhat";

//import { main, getData } from "../../../scripts/OKX-DEX-API/okx-dex-sdk-integrations/okx-dex-sdk-api-request-sample"; 


it("proves and verifies on-chain", async () => {
  // Deploy the ZkTLSIntegrationsProofVerifier contract, which the HonkVerifier contract is inherited.
  const contractFactory = await ethers.getContractFactory("ZkTLSIntegrationsProofVerifier");
  const contract = await contractFactory.deploy();
  await contract.waitForDeployment();
  console.log("Deployed contract address of the ZkTLSIntegrationsProofVerifier.sol:", await contract.getAddress());
  
  // @dev - sample API response (header + body), which is referenced from the test_http_data_long_header.nr 
  const input = {
    response: `HTTP/1.1 200 OK
    content-type: application/json; charset=utf-8
    content-encoding: gzip
    Transfer-Encoding: chunked
    Connection: close
    Source-Age: 153

    {
      "hello": "world"
    }`
  }
  //const input = { x: 1, y: 2 };

  // @dev - Generate a proof
  const { noir, backend } = await hre.noir.getCircuit("zktls_integrations"); // @dev - "zktls_integrations" is defined in the Nargo.toml ("name")
  const { witness } = await noir.execute(input);
  const { proof, publicInputs } = await backend.generateProof(witness, {
    keccak: true,
  });
  // it matches because we marked y as `pub` in `main.nr`
  expect(BigInt(publicInputs[0])).to.eq(BigInt(input.y));

  // Verify the proof on-chain
  const result = await contract.verify(proof, input.y);
  expect(result).to.eq(true);

  // You can also verify in JavaScript.
  const resultJs = await backend.verifyProof(
    {
      proof,
      publicInputs: [String(input.y)],
    },
    { keccak: true },
  );
  expect(resultJs).to.eq(true);
});
