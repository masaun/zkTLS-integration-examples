mod crate::zktls::test_http_data_okx_dex_api;

#[test]
fn generate_test_http_data_for_DEX_API_response_header_and_body() {
    let start_line = "HTTP/1.1 200 OK".as_bytes().map(|x| x);
    let header_0 = "Content-Type: text/xml; charset=utf-8".as_bytes().map(|x| x);
    let header_1 = "Content-Length: 6574".as_bytes().map(|x| x);
    let header_2 = "Date: Sat, 06 Jul 2024 01:12:33 GMT".as_bytes().map(|x| x);
    let header_3 = "Server: Workday".as_bytes().map(|x| x);
    println(f"Start Line: {start_line}\n");
    println(f"Header 0: {header_0}\n");
    println(f"Header 1: {header_1}\n");
    println(f"Header 2: {header_2}\n");
    println(f"Header 3: {header_3}\n");

    let start_line_in_field = "HTTP/1.1 200 OK".as_bytes().map(|x| x as Field);
    let header_0_in_field = "Content-Type: text/xml; charset=utf-8".as_bytes().map(|x| x as Field);
    let header_1_in_field = "Content-Length: 6574".as_bytes().map(|x| x as Field);
    let header_2_in_field = "Date: Sat, 06 Jul 2024 01:12:33 GMT".as_bytes().map(|x| x as Field);
    let header_3_in_field = "Server: Workday".as_bytes().map(|x| x as Field);
    println(f"Start Line (in Field type): {start_line_in_field}\n");
    println(f"Header 0 (in Field type): {header_0_in_field}\n");
    println(f"Header 1 (in Field type): {header_1_in_field}\n");
    println(f"Header 2 (in Field type): {header_2_in_field}\n");
    println(f"Header 3 (in Field type): {header_3_in_field}\n");
}
