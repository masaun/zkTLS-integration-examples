use crate::zktls::test_http_data_docusign;

#[test]
fn generate_test_http_data_for_docusign_response_header_and_body() {
    // @dev - Generating the API response header in bytes
    // let response_header_plain_text = test_http_data_docusign::response_header_plain_test();
    // let response_header_bytes = response_header_plain_text.as_bytes().map(|x: u8| x);
    // println(f"Response Header (in bytes): {response_header_bytes}\n");  // @dev - [Result]: Successful to convert the response from string to bytes ([u

    // @dev - Generating the API response body in bytes
    let response_body_plain_text = response_body_plain_test();
    let response_body_bytes = response_body_plain_text.as_bytes().map(|x: u8| x);
    println(f"Response Body (in bytes): {response_body_bytes}\n");  // @dev - [Result]: Successful to convert the response from string to bytes ([u8; N])

    // @dev - Concatenating the whole API response (header + body) in bytes
    let response_bytes = response_body_bytes;
    //let response_bytes = response_header_bytes.concat(response_body_bytes);
    println(f"Response (header + body in bytes): {response_bytes}\n"); // @dev - In case of DocuSign, there is no API response header. Hence, only API response body is returned as a full API response.
}


/**
 * @notice - Example response body of the DEX API in a plain text format.
 */
fn response_header_plain_test() -> str<7> {
    let response_header_plain_test = "Nothing";
    
    // @dev - Returning the API response header as a string
    response_header_plain_test
}

/**
 * @notice - Example response body of the DEX API in a plain text format.
 */
fn response_body_plain_test() -> str<211> {
    // {
    //   "paymentId": "sample string 1",
    //   "amount": "sample string 2",
    //   "paymentDate": "sample string 3",
    //   "paymentNumber": "sample string 4",
    //   "description": "sample string 5"
    // }

    let response_body_plain_test = "{
        \"paymentId\": \"sample string 1\",
        \"amount\": \"sample string 2\",
        \"paymentDate\": \"sample string 3\",
        \"paymentNumber\": \"sample string 4\",
        \"description\": \"sample string 5\"
    }";

    // @dev - Returning the response as a string
    response_body_plain_test
}