use crate::zktls::test_http_data_okx_dex_api;

#[test]
fn generate_test_http_data_for_DEX_API_response_header_and_body() {
    let start_line = "\"date\": \"Thu, 10 Jul 2025 03:34:36 GMT\"".as_bytes().map(|x| x);
    let header_0 = "\"content-type\": \"application/json;charset=UTF-8\"".as_bytes().map(|x| x);
    let header_1 = "\"transfer-encoding\": \"chunked\"".as_bytes().map(|x| x);
    let header_2 = "Server: Workday".as_bytes().map(|x| x);
    let header_3 = "\"vary\": \"Accept-Encoding\"".as_bytes().map(|x| x);
    println(f"Start Line: {start_line}\n");
    println(f"Header 0: {header_0}\n");
    println(f"Header 1: {header_1}\n");
    println(f"Header 2: {header_2}\n");
    println(f"Header 3: {header_3}\n");

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
fn response_header_plain_test() -> str<1112> {
    let response_header_plain_test = "{
        \"date\": \"Thu, 10 Jul 2025 03:34:36 GMT\",
        \"content-type\": \"application/json;charset=UTF-8\",
        \"transfer-encoding\": \"chunked\",
        \"connection\": \"keep-alive\",
        \"vary\": \"Accept-Encoding\",
        \"set-cookie\": [
            \"locale=en-US; Max-Age=604800; Expires=Thu, 17-Jul-2025 03:34:36 GMT; Path=/\",
            \"__cf_bm=nOLEpRAqS08Ck_p20ZOR_om74A_U6NdMzeXyPjuRDCY-1752118476-1.0.1.1-9GL3gnxhdlVxAsHLxGpZH9B3hJilGJOCwnX9gy_ct0BVvEggqwlwbRhTIpQWjL5tHp4JmnT6WdHuKEPrnCK7OeosGDWCH5TtEbG6h8i1rPU; path=/; expires=Thu, 10-Jul-25 04:04:36 GMT; domain=.okx.com; HttpOnly; Secure; SameSite=None\"
        ],
        \"b-locale\": \"en_US\",
        \"content-security-policy\": \"frame-ancestors 'self'\",
        \"access-control-allow-origin\": \"*\",
        \"x-brokerid\": \"0\",
        \"strict-transport-security\": \"max-age=31536000; includeSubDomains\",
        \"x-xss-protection\": \"1; mode=block\",
        \"x-frame-options\": \"DENY\",
        \"x-content-type-options\": \"nosniff\",
        \"cf-cache-status\": \"DYNAMIC\",
        \"server\": \"cloudflare\",
        \"cf-ray\": \"95cd019c3ad57822-NRT\"
    }";
    
    // @dev - Returning the API response header as a string
    response_header_plain_test
}

/**
 * @notice - Example response body of the DEX API in a plain text format.
 */
fn response_body_plain_test() -> str<3073> {
    let response_body_plain_test = "{
        \"chainId\": \"8453\",
        \"chainIndex\": \"8453\",
        \"contextSlot\": 0,
        \"dexRouterList\": [
            {
            \"router\": \"0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE--0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913\",
            \"routerPercent\": \"100\",
            \"subRouterList\": [
                {
                \"dexProtocol\": [
                    {
                    \"dexName\": \"Uniswap V3\",
                    \"percent\": \"100\"
                    }
                ],
                \"fromToken\": {
                    \"decimal\": \"18\",
                    \"isHoneyPot\": false,
                    \"taxRate\": \"0\",
                    \"tokenContractAddress\": \"0x4200000000000000000000000000000000000006\",
                    \"tokenSymbol\": \"WETH\",
                    \"tokenUnitPrice\": \"2774.857698511993422849\"
                },
                \"toToken\": {
                    \"decimal\": \"6\",
                    \"isHoneyPot\": false,
                    \"taxRate\": \"0\",
                    \"tokenContractAddress\": \"0x833589fcd6edb6e08f4c7c32d4f71b54bda02913\",
                    \"tokenSymbol\": \"USDC\",
                    \"tokenUnitPrice\": \"1.00004407486844178\"
                }
                }
            ]
            }
        ],
        \"estimateGasFee\": \"135000\",
        \"fromToken\": {
            \"decimal\": \"18\",
            \"isHoneyPot\": false,
            \"taxRate\": \"0\",
            \"tokenContractAddress\": \"0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee\",
            \"tokenSymbol\": \"BASE_ETH\",
            \"tokenUnitPrice\": \"2774.857698511993422849\"
        },
        \"fromTokenAmount\": \"500000000000000\",
        \"priceImpactPercentage\": \"0.01\",
        \"quoteCompareList\": [
            {
            \"amountOut\": \"1.387474\",
            \"dexLogo\": \"https://static.okx.com/cdn/wallet/logo/UNI.png\",
            \"dexName\": \"Uniswap V3\",
            \"tradeFee\": \"0.00139188672804195\"
            },
            {
            \"amountOut\": \"1.387256\",
            \"dexLogo\": \"https://static.okx.com/cdn/wallet/logo/Dex_BaseSwap.png\",
            \"dexName\": \"BaseSwap V3\",
            \"tradeFee\": \"0.00197957223543744\"
            },
            {
            \"amountOut\": \"1.386399\",
            \"dexLogo\": \"https://static.okx.com/cdn/explorer/dex/logo/solidly.png\",
            \"dexName\": \"Solidly V3\",
            \"tradeFee\": \"0.00197957223543744\"
            },
            {
            \"amountOut\": \"1.386382\",
            \"dexLogo\": \"https://static.okx.com/cdn/explorer/dex/logo/Dex_Aerodrome.png\",
            \"dexName\": \"AerodromeSlipstream\",
            \"tradeFee\": \"0.00197957223543744\"
            }
        ],
        \"swapMode\": \"exactIn\",
        \"toToken\": {
            \"decimal\": \"6\",
            \"isHoneyPot\": false,
            \"taxRate\": \"0\",
            \"tokenContractAddress\": \"0x833589fcd6edb6e08f4c7c32d4f71b54bda02913\",
            \"tokenSymbol\": \"USDC\",
            \"tokenUnitPrice\": \"1.00004407486844178\"
        },
        \"toTokenAmount\": \"1387474\",
        \"tradeFee\": \"0.00139188672804195\"
    }";

    // @dev - Returning the response as a string
    response_body_plain_test
}