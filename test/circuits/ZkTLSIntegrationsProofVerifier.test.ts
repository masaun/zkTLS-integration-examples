import { expect } from "chai";
import hre, { ethers } from "hardhat";

it("proves and verifies on-chain", async () => {
  // Deploy a verifier contract
  const contractFactory = await ethers.getContractFactory("ZkTLSIntegrationsProofVerifier");
  const contract = await contractFactory.deploy();
  await contract.waitForDeployment();
  console.log("Deployed contract address of the MyContract.sol:", await contract.getAddress());

  // Generate a proof
  const { noir, backend } = await hre.noir.getCircuit("zktls_integrations"); // @dev - "zktls_integrations" is defined in the Nargo.toml ("name")
  const input = { x: 1, y: 2 };
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
