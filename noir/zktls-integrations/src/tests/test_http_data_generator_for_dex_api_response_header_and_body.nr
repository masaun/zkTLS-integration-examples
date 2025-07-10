use crate::zktls::test_http_data_okx_dex_api;

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

    let response_plain_text = response_plain_test();
    let response_bytes = response_plain_text.as_bytes().map(|x| x);
    println(f"Response (in bytes): {response_bytes}\n");  // @dev - [Result]: Successful to convert the response from string to bytes ([u8; N])
}


/**
 * @notice - Example response of the DEX API in a plain text format.
 */
fn response_plain_test() -> str<3073> {
    let response_plain_test = "{
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
    response_plain_test
}