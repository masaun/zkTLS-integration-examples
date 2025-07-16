use crate::zktls::test_http_data_okx_dex_api;

#[test]
fn generate_test_http_data_for_DEX_API_response_header_and_body() {
    let start_line_in_field = "\"date\": \"Thu, 10 Jul 2025 03:34:36 GMT\"".as_bytes().map(|x| x as Field);
    let header_0_in_field = "\"content-type\": \"application/json;charset=UTF-8\"".as_bytes().map(|x| x as Field);
    let header_1_in_field = "\"transfer-encoding\": \"chunked\"".as_bytes().map(|x| x as Field);
    let header_2_in_field = "\"connection\": \"keep-alive\"".as_bytes().map(|x| x as Field);
    let header_3_in_field = "\"vary\": \"Accept-Encoding\"".as_bytes().map(|x| x as Field);
    println(f"start_line (in Field): {start_line_in_field}\n");
    println(f"header_0 (in Field): {header_0_in_field}\n");
    println(f"header_1 (in Field): {header_1_in_field}\n");
    println(f"header_2 (in Field): {header_2_in_field}\n");
    println(f"header_3 (in Field): {header_3_in_field}\n");

    // @dev - Generating the API response header in bytes
    let response_header_plain_text = test_http_data_okx_dex_api::response_header_plain_test();
    let response_header_bytes = response_header_plain_text.as_bytes().map(|x: u8| x);
    println(f"Response Header (in bytes): {response_header_bytes}\n");  // @dev - [Result]: Successful to convert the response from string to bytes ([u

    // @dev - Generating the API response body in bytes
    let response_body_plain_text = response_body_plain_test();
    let response_body_bytes = response_body_plain_text.as_bytes().map(|x: u8| x);
    println(f"Response Body (in bytes): {response_body_bytes}\n");  // @dev - [Result]: Successful to convert the response from string to bytes ([u8; N])

    // @dev - Concatenating the whole API response (header + body) in bytes
    let response_bytes = response_header_bytes.concat(response_body_bytes);
    println(f"Response (header + body in bytes): {response_bytes}\n");
}


/**
 * @notice - Example response body of the DEX API in a plain text format.
 */
fn response_header_plain_test() -> str<7> {
    let response_header_plain_test = "Nothing"
    
    // @dev - Returning the API response header as a string
    response_header_plain_test
}

/**
 * @notice - Example response body of the DEX API in a plain text format.
 */
fn response_body_plain_test() -> str<3073> {
    // {
    //   "paymentId": "sample string 1",
    //   "amount": "sample string 2",
    //   "paymentDate": "sample string 3",
    //   "paymentNumber": "sample string 4",
    //   "description": "sample string 5"
    // }

    let response_body_plain_test = "{\
        \"paymentId\": \"sample string 1\",\
        \"amount\": \"sample string 2\",\
        \"paymentDate\": \"sample string 3\",\
        \"paymentNumber\": \"sample string 4\",\
        \"description\": \"sample string 5\"\
    }";

    // @dev - Returning the response as a string
    response_body_plain_test
}