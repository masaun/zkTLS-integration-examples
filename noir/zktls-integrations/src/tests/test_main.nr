use crate::{
    main,
    zktls::{
        test_inputs::{polynomial_input, polynomial_digest, NUM_HEADERS},
        test_http_data, 
        test_http_data_long_header,
        test_http_data_okx_dex_api
    }
};

#[test]
fn test_main() {
    // @dev - Input parameters for zkTLS circuit
    let response_plaintext_bytes: [u8; 4185] = test_http_data_okx_dex_api::response();
    //let response_plaintext_bytes: [u8; 320] = test_http_data::response();
    let mut line_digests = [Field::default(); NUM_HEADERS];
    let polynomial_input: Field = polynomial_input(); // Polynomial input for zkTLS circuit


    // @dev - Noir Web Prover
    main(
        response_plaintext_bytes,
        line_digests,
        polynomial_input
        //1, 
        //2
    );

    // Uncomment to make test fail
    // main(1, 1);
}