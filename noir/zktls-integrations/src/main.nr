mod tests;
mod zktls;

use zktls::noir_web_prover_integrator::{verify_http_data};

fn main(
    // @dev - Noir Web Prover
    response_plaintext_bytes: [u8; 320],
    line_digests: [Field; 10],
    polynomial_input: Field
    //x: Field, 
    //y: pub Field,
) {
    // @dev - Noir Web Prover
    verify_http_data(response_plaintext_bytes, line_digests, polynomial_input);

    //assert(x != y);
}
