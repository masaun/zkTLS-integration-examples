// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.27;

import { HonkVerifier } from "./honk-verifier/honk_vk.sol";
//import {HonkVerifier} from "../noir/target/zktls_integrations.sol";

contract ZkTLSIntegrationsProofVerifier {
    HonkVerifier public verifier = new HonkVerifier(); // @dev - Deploy the HonkVerifier contract

    function verify(
        bytes calldata proof,
        uint256 y
    ) external view returns (bool) {
        bytes32[] memory publicInputs = new bytes32[](1);
        publicInputs[0] = bytes32(y);
        bool result = verifier.verify(proof, publicInputs);
        return result;
    }
}
