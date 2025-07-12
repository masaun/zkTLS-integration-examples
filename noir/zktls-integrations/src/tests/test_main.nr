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

    // @dev - Fetch the test data of OKX DEX API
    let response = test_http_data_okx_dex_api::response();
    let start_line = test_http_data_okx_dex_api::start_line();
    let header_0 = test_http_data_okx_dex_api::header_0();
    let header_1 = test_http_data_okx_dex_api::header_1();
    let header_2 = test_http_data_okx_dex_api::header_1();
    let header_3 = test_http_data_okx_dex_api::header_1();
    let body = test_http_data_okx_dex_api::body();
    let body_in_field = test_http_data_okx_dex_api::body_in_field();

    // @dev - Create the polynominal digests of the test data of OKX DEX API
    let start_line_digest = polynomial_digest(start_line, polynomial_input, 1);
    let header_0_digest = polynomial_digest(header_0, polynomial_input, 1);
    let header_1_digest = polynomial_digest(header_1, polynomial_input, 1);
    let header_2_digest = polynomial_digest(header_2, polynomial_input, 1);
    let header_3_digest = polynomial_digest(header_3, polynomial_input, 1);
    //let body_digest = polynomial_digest(body, polynomial_input, 1);
    let body_digest = polynomial_digest(body_in_field, polynomial_input, 1);

    // @dev - Set the line digests for the test data of OKX DEX API
    line_digests[0] = start_line_digest;
    line_digests[1] = header_0_digest;
    line_digests[2] = header_1_digest;
    line_digests[3] = header_2_digest;
    line_digests[4] = header_3_digest;
    //line_digests[5] = body_digest;    // @dev - [Experimentation]: Whether or not the circuit test can finish to run. 

    // @dev - Noir Web Prover
    main(
        response_plaintext_bytes,
        line_digests,
        polynomial_input
    );
}