/**
 * @notice - HTTP data, which have a long HTTP header, for testing purpose.
 * @dev - DocuSign API reference: https://developers.docusign.com/docs/esign-rest-api/reference/billing/payments/get/
 */

use crate::tests::{
    test_http_data_generator_for_docusign_response_header_and_body::{
        response_plain_test,
        response_body_plain_test
    }
};


// Here is the full API response (of DocuSign)
// NOTE: No API response "header". Only API response "body" is returned.

// {
//   "paymentId": "sample string 1",
//   "amount": "sample string 2",
//   "paymentDate": "sample string 3",
//   "paymentNumber": "sample string 4",
//   "description": "sample string 5"
// }
pub fn response() -> [u8; 211] {
    let response_plain_test = response_plain_test();
    let response_bytes = response_plain_test.as_bytes().map(|x| x as u8);
    response_bytes
}


// {
//   "paymentId": "sample string 1",
//   "amount": "sample string 2",
//   "paymentDate": "sample string 3",
//   "paymentNumber": "sample string 4",
//   "description": "sample string 5"
// }
pub fn body() -> [u8; 211] {
    let response_body_plain_test = response_body_plain_test();
    let response_body_bytes = response_body_plain_test.as_bytes().map(|x| x as u8);
    response_body_bytes
}
