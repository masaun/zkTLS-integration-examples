use crate::{
    main,
    MAX_RESPONSE_LENGTH, MAX_START_LINE_LENGTH, 
    MAX_HEADER_0_LENGTH, MAX_HEADER_1_LENGTH, MAX_HEADER_2_LENGTH, MAX_HEADER_3_LENGTH, 
    MAX_BODY_LENGTH,
    zktls::{
        test_inputs::{polynomial_input, polynomial_digest, NUM_HEADERS},
        //test_http_data, 
        //test_http_data_long_header,
        test_http_data_okx_dex_api
    }
};

#[test]
fn test_main_okx_dex_api() {
    // @dev - Fetch the test data of OKX DEX API
    let response_vec: BoundedVec<u8, MAX_RESPONSE_LENGTH> = BoundedVec::from(test_http_data_okx_dex_api::response());
    let start_line_vec: BoundedVec<u8, MAX_START_LINE_LENGTH> = BoundedVec::from(test_http_data_okx_dex_api::start_line().map(|x| x as u8));
    let header_0_vec: BoundedVec<u8, MAX_HEADER_0_LENGTH> = BoundedVec::from(test_http_data_okx_dex_api::header_0().map(|x| x as u8));
    let header_1_vec: BoundedVec<u8, MAX_HEADER_1_LENGTH> = BoundedVec::from(test_http_data_okx_dex_api::header_1().map(|x| x as u8));
    let header_2_vec: BoundedVec<u8, MAX_HEADER_2_LENGTH> = BoundedVec::from(test_http_data_okx_dex_api::header_2().map(|x| x as u8));
    let header_3_vec: BoundedVec<u8, MAX_HEADER_3_LENGTH> = BoundedVec::from(test_http_data_okx_dex_api::header_3().map(|x| x as u8));
    let body_vec: BoundedVec<u8, MAX_BODY_LENGTH> = BoundedVec::from(test_http_data_okx_dex_api::body());

    // @dev - Noir Web Prover
    main(
        response_vec,
        start_line_vec,
        header_0_vec,
        header_1_vec,
        header_2_vec,
        header_3_vec,
        body_vec
    );
}