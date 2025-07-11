use noir_web_prover::{
    parser::Parser,
    setup::SetupState,
    utils::{polynomial_digest, hash_accumulate},
};

use poseidon::poseidon::bn254::{hash_1, hash_2};




fn verify_http_data(
    response_plaintext_bytes: [u8; 320],
    line_digests: [Field; 10], // @dev - Aligned to the "NUM_HEADERS" -> At this point, we assume 5 headers: [start_line, header_0, ..., header_4]
    polynomial_input: Field
) {
    let machine_state = Parser::default(); // @dev - This "machine_state" is also called the "Self" as well.
    Parser::digest(machine_state, polynomial_input);

    let step_in = [
        0,
        0,
        1, // ciphertext_digest_pow
        machine_state.digest(polynomial_input), // machine_state_digest
        hash_accumulate(line_digests), // sumof hashof digestof inputs
        5, // total number of matches to expect (= 5 headers = start_line + 4 headers)
        0, // body_monomials
        0, // 7, 8, 9, 10, 11 is not used
        0,
        0,
        0,
    ];

    let setup = SetupState { data: response_plaintext_bytes, line_digests, polynomial_input };

    let step_out = setup.verify(step_in, machine_state);
}