mod tests;
mod zktls;

use zktls::noir_web_prover_integrator::{verify_http_data};

global MAX_RESPONSE_LENGTH: u32 = 320; // Maximum length of full response (header + body) in bytes
global MAX_HEADER_LENGTH: u32 = 320;   // Maximum length of full header in bytes
global MAX_START_LINE_LENGTH: u32 = 320; // Maximum length of start_line in bytes
global MAX_HEADER_0_LENGTH: u32 = 320;   // Maximum length of header_0 in bytes
global MAX_HEADER_1_LENGTH: u32 = 320;   // Maximum length of header_1 in bytes
global MAX_HEADER_2_LENGTH: u32 = 320;   // Maximum length of header_2 in bytes
global MAX_HEADER_3_LENGTH: u32 = 320;   // Maximum length of header_3 in bytes
global MAX_BODY_LENGTH: u32 = 320;

/**
 * @notice - main function to verify HTTP data
 */
fn main(
    response_bytes: BoundedVec<u8, MAX_RESPONSE_LENGTH>,
    header_bytes: BoundedVec<u8, MAX_HEADER_LENGTH>,
    start_line_bytes: BoundedVec<u8, MAX_HEADER_0_LENGTH>,
    header_0_bytes: BoundedVec<u8, MAX_HEADER_0_LENGTH>,
    header_1_bytes: BoundedVec<u8, MAX_HEADER_1_LENGTH>,
    header_2_bytes: BoundedVec<u8, MAX_HEADER_2_LENGTH>,
    header_3_bytes: BoundedVec<u8, MAX_HEADER_3_LENGTH>,
    body_bytes: BoundedVec<u8, MAX_BODY_LENGTH>

    // @dev - Noir Web Prover
    //response_plaintext_bytes: [u8; 4185],
    //response_plaintext_bytes: [u8; 320],
    //line_digests: [Field; 10], // @dev - Aligned to the "NUM_HEADERS" -> At this point, we assume 5 headers: [start_line, header_0, ..., header_4]
    //polynomial_input: Field
) {
    // @dev - Noir Web Prover
    verify_http_data(response_plaintext_bytes, line_digests, polynomial_input);
}
