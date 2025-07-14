use crate::zktls::test_inputs::{polynomial_input, NUM_HEADERS};

use noir_web_prover::{
    parser::Parser,
    setup::SetupState,
    utils::{polynomial_digest, hash_accumulate},
};

use poseidon::poseidon::bn254::{hash_1, hash_2};


fn verify_http_data(
    response_bytes: [u8; 920],
    start_line_field: [Field; 50],
    header_0_field: [Field; 50],
    header_1_field: [Field; 50],
    header_2_field: [Field; 50],
    header_3_field: [Field; 50],
    body_field: [Field; 600]
) {
    // @dev - Setup the line digests and polynomial input
    let mut line_digests = [Field::default(); NUM_HEADERS];
    let polynomial_input: Field = polynomial_input(); // Polynomial input for zkTLS circuit

    // @dev - Create the polynominal digests of the test data of OKX DEX API
    let start_line_digest = polynomial_digest(start_line_field, polynomial_input, 1);
    let header_0_digest = polynomial_digest(header_0_field, polynomial_input, 1);
    let header_1_digest = polynomial_digest(header_1_field, polynomial_input, 1);
    let header_2_digest = polynomial_digest(header_2_field, polynomial_input, 1);
    let header_3_digest = polynomial_digest(header_3_field, polynomial_input, 1);
    //let body_digest = polynomial_digest(body, polynomial_input, 1);
    let body_digest = polynomial_digest(body_field, polynomial_input, 1);

    // @dev - Set the line digests for the test data of OKX DEX API
    line_digests[0] = start_line_digest;
    line_digests[1] = header_0_digest;
    line_digests[2] = header_1_digest;
    line_digests[3] = header_2_digest;
    line_digests[4] = header_3_digest;
    //line_digests[5] = body_digest;    // @dev - [Experimentation]: Whether or not the circuit test can finish to run. 

    // @dev - Setup
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

    let setup = SetupState { data: response_bytes, line_digests, polynomial_input };

    let step_out = setup.verify(step_in, machine_state);
}