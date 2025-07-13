mod tests;
mod zktls;

use zktls::noir_web_prover_integrator::{verify_http_data};

fn main(
    // @dev - Noir Web Prover
    //response_plaintext_bytes: [u8; 4185],
    response_plaintext_bytes: [u8; 320],
    line_digests: [Field; 10], // @dev - Aligned to the "NUM_HEADERS" -> At this point, we assume 5 headers: [start_line, header_0, ..., header_4]
    polynomial_input: Field
) {
    // @dev - Noir Web Prover
    verify_http_data(response_plaintext_bytes, line_digests, polynomial_input);
}
