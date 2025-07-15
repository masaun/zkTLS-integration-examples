import { expect } from "chai";
import hre, { ethers } from "hardhat";

//import { main, getData } from "../../../scripts/OKX-DEX-API/okx-dex-sdk-integrations/okx-dex-sdk-api-request-sample"; 

const MAX_RESPONSE_LENGTH = 920;   // Maximum length of full response (header + body) in bytes
const MAX_START_LINE_LENGTH = 50;  // Maximum length of start_line in bytes
const MAX_HEADER_0_LENGTH = 50;    // Maximum length of header_0 in bytes
const MAX_HEADER_1_LENGTH = 50;    // Maximum length of header_1 in bytes
const MAX_HEADER_2_LENGTH = 50;    // Maximum length of header_2 in bytes
const MAX_HEADER_3_LENGTH = 50;    // Maximum length of header_3 in bytes
const MAX_BODY_LENGTH = 600;       // Maximum length of body in bytes


it("proves and verifies on-chain", async () => {
  // Deploy the ZkTLSIntegrationsProofVerifier contract, which the HonkVerifier contract is inherited.
  const contractFactory = await ethers.getContractFactory("ZkTLSIntegrationsProofVerifier");
  const contract = await contractFactory.deploy();
  await contract.waitForDeployment();
  console.log("Deployed contract address of the ZkTLSIntegrationsProofVerifier.sol:", await contract.getAddress());
  
  // @dev - Create a input
  const response = `HTTP/1.1 200 OK
    content-type: application/json; charset=utf-8
    content-encoding: gzip
    Transfer-Encoding: chunked
    Connection: close
    Source-Age: 153

    {
      "hello": "world"
    }`
  
  const start_line = `HTTP/1.1 200 OK`
  const header_0 = `content-type: application/json; charset=utf-8`
  const header_1 = `content-encoding: gzip`
  const header_2 = `Transfer-Encoding: chunked`
  const header_3 = `Connection: close`
  const header_4 = `Source-Age: 153`
  const body = `{
    "hello": "world"
  }`

  const responseUint8Array = new Uint8Array(MAX_RESPONSE_LENGTH);
  responseUint8Array.set(Uint8Array.from(new TextEncoder().encode(response)));

  const startLineUint8Array = new Uint8Array(MAX_START_LINE_LENGTH);
  startLineUint8Array.set(Uint8Array.from(new TextEncoder().encode(start_line)));

  const header0Uint8Array = new Uint8Array(MAX_HEADER_0_LENGTH);
  header0Uint8Array.set(Uint8Array.from(new TextEncoder().encode(header_0)));

  const header1Uint8Array = new Uint8Array(MAX_HEADER_1_LENGTH);
  header1Uint8Array.set(Uint8Array.from(new TextEncoder().encode(header_1)));

  const header2Uint8Array = new Uint8Array(MAX_HEADER_2_LENGTH);
  header2Uint8Array.set(Uint8Array.from(new TextEncoder().encode(header_2)));

  const header3Uint8Array = new Uint8Array(MAX_HEADER_3_LENGTH);
  header3Uint8Array.set(Uint8Array.from(new TextEncoder().encode(header_3)));

  const bodyUint8Array = new Uint8Array(MAX_BODY_LENGTH);
  bodyUint8Array.set(Uint8Array.from(new TextEncoder().encode(body)));

  const secret = 1234567

  // @dev - sample API response (header + body), which is referenced from the test_http_data_long_header.nr 
  const input = {
    response_vec: {
      storage: Array.from(responseUint8Array),
      len: Array.from(responseUint8Array).length,
    },
    start_line_vec: {
      storage: Array.from(startLineUint8Array),
      len: Array.from(startLineUint8Array).length,
    },
    header_0_vec: {
      storage: Array.from(header0Uint8Array),
      len: Array.from(header0Uint8Array).length,
    },
    header_1_vec: {
      storage: Array.from(header1Uint8Array),
      len: Array.from(header1Uint8Array).length,
    },
    header_2_vec: {
      storage: Array.from(header2Uint8Array),
      len: Array.from(header2Uint8Array).length,
    },
    header_3_vec: {
      storage: Array.from(header3Uint8Array),
      len: Array.from(header3Uint8Array).length,
    },
    body_vec: {
      storage: Array.from(bodyUint8Array),
      len: Array.from(bodyUint8Array).length,
    },
    secret: secret,
  }
  //const input = { x: 1, y: 2 };

  // @dev - Generate a proof
  const { noir, backend } = await hre.noir.getCircuit("zktls-integrations"); // @dev - "zktls-integrations" is defined in the Nargo.toml ("name")
  const { witness } = await noir.execute(input);
  const { proof, publicInputs } = await backend.generateProof(witness, {
    keccak: true,
  });

  const nullifier = publicInputs[0];

  // it matches because we marked y as `pub` in `main.nr`
  expect(publicInputs[0]).to.eq(nullifier);
  //expect(BigInt(publicInputs[0])).to.eq(BigInt(publicInputs[0]));

  // Verify the proof on-chain
  const result = await contract.verify(proof, nullifier);
  expect(result).to.eq(true);

  // You can also verify in JavaScript.
  const resultJs = await backend.verifyProof(
    {
      proof,
      publicInputs: [nullifier]
      //publicInputs: [String(input.y)],
    },
    { keccak: true },
  );
  expect(resultJs).to.eq(true);
});
