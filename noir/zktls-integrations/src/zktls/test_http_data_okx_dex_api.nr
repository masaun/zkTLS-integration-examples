/**
 * @notice - HTTP data of OKX DEX API (https://web3.okx.com/build/dev-docs/dex-api/) for testing purpose.
 */

// HTTP/1.1 200 OK
// content-type: application/json; charset=utf-8
// content-encoding: gzip
// Transfer-Encoding: chunked

// {
//   "chainId": "8453",
//   "chainIndex": "8453",
//   "contextSlot": 0,
//   "dexRouterList": [
//     {
//       "router": "0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE--0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913",
//       "routerPercent": "100",
//       "subRouterList": [
//         {
//           "dexProtocol": [
//             {
//               "dexName": "Uniswap V3",
//               "percent": "100"
//             }
//           ],
//           "fromToken": {
//             "decimal": "18",
//             "isHoneyPot": false,
//             "taxRate": "0",
//             "tokenContractAddress": "0x4200000000000000000000000000000000000006",
//             "tokenSymbol": "WETH",
//             "tokenUnitPrice": "2774.857698511993422849"
//           },
//           "toToken": {
//             "decimal": "6",
//             "isHoneyPot": false,
//             "taxRate": "0",
//             "tokenContractAddress": "0x833589fcd6edb6e08f4c7c32d4f71b54bda02913",
//             "tokenSymbol": "USDC",
//             "tokenUnitPrice": "1.00004407486844178"
//           }
//         }
//       ]
//     }
//   ],
//   "estimateGasFee": "135000",
//   "fromToken": {
//     "decimal": "18",
//     "isHoneyPot": false,
//     "taxRate": "0",
//     "tokenContractAddress": "0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
//     "tokenSymbol": "BASE_ETH",
//     "tokenUnitPrice": "2774.857698511993422849"
//   },
//   "fromTokenAmount": "500000000000000",
//   "priceImpactPercentage": "0.01",
//   "quoteCompareList": [
//     {
//       "amountOut": "1.387474",
//       "dexLogo": "https://static.okx.com/cdn/wallet/logo/UNI.png",
//       "dexName": "Uniswap V3",
//       "tradeFee": "0.00139188672804195"
//     },
//     {
//       "amountOut": "1.387256",
//       "dexLogo": "https://static.okx.com/cdn/wallet/logo/Dex_BaseSwap.png",
//       "dexName": "BaseSwap V3",
//       "tradeFee": "0.00197957223543744"
//     },
//     {
//       "amountOut": "1.386399",
//       "dexLogo": "https://static.okx.com/cdn/explorer/dex/logo/solidly.png",
//       "dexName": "Solidly V3",
//       "tradeFee": "0.00197957223543744"
//     },
//     {
//       "amountOut": "1.386382",
//       "dexLogo": "https://static.okx.com/cdn/explorer/dex/logo/Dex_Aerodrome.png",
//       "dexName": "AerodromeSlipstream",
//       "tradeFee": "0.00197957223543744"
//     }
//   ],
//   "swapMode": "exactIn",
//   "toToken": {
//     "decimal": "6",
//     "isHoneyPot": false,
//     "taxRate": "0",
//     "tokenContractAddress": "0x833589fcd6edb6e08f4c7c32d4f71b54bda02913",
//     "tokenSymbol": "USDC",
//     "tokenUnitPrice": "1.00004407486844178"
//   },
//   "toTokenAmount": "1387474",
//   "tradeFee": "0.00139188672804195"
// }
pub fn response() -> [u8; 320] {
    [
        72, 84, 84, 80, 47, 49, 46, 49, 32, 50, 48, 48, 32, 79, 75, 13, 10, 99, 111, 110, 116,
        101, 110, 116, 45, 116, 121, 112, 101, 58, 32, 97, 112, 112, 108, 105, 99, 97, 116, 105,
        111, 110, 47, 106, 115, 111, 110, 59, 32, 99, 104, 97, 114, 115, 101, 116, 61, 117, 116,
        102, 45, 56, 13, 10, 99, 111, 110, 116, 101, 110, 116, 45, 101, 110, 99, 111, 100, 105,
        110, 103, 58, 32, 103, 122, 105, 112, 13, 10, 84, 114, 97, 110, 115, 102, 101, 114, 45,
        69, 110, 99, 111, 100, 105, 110, 103, 58, 32, 99, 104, 117, 110, 107, 101, 100, 13, 10,
        13, 10, 123, 13, 10, 32, 32, 32, 34, 100, 97, 116, 97, 34, 58, 32, 123, 13, 10, 32, 32,
        32, 32, 32, 32, 32, 34, 105, 116, 101, 109, 115, 34, 58, 32, 91, 13, 10, 32, 32, 32, 32,
        32, 32, 32, 32, 32, 32, 32, 123, 13, 10, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
        32, 32, 32, 34, 100, 97, 116, 97, 34, 58, 32, 34, 65, 114, 116, 105, 115, 116, 34, 44,
        13, 10, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 34, 112, 114, 111,
        102, 105, 108, 101, 34, 58, 32, 123, 13, 10, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
        32, 32, 32, 32, 32, 34, 110, 97, 109, 101, 34, 58, 32, 34, 84, 97, 121, 108, 111, 114,
        32, 83, 119, 105, 102, 116, 34, 13, 10, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
        32, 32, 32, 125, 13, 10, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 125, 13, 10, 32,
        32, 32, 32, 32, 32, 32, 93, 13, 10, 32, 32, 32, 125, 13, 10, 125,
    ]
}

//   72, 84, 84, 80, 47, 49, 46, 49, 32, 50, 48, 48, 32, 79, 75,
pub fn start_line() -> [Field; 15] {
    "HTTP/1.1 200 OK".as_bytes().map(|x| x as Field)
}

// [
//   99, 111, 110, 116, 101, 110, 116, 45, 116, 121, 112, 101, 58, 32, 97, 112,
//   112, 108, 105, 99, 97, 116, 105, 111, 110, 47, 106, 115, 111, 110, 59, 32, 99,
//   104, 97, 114, 115, 101, 116, 61, 117, 116, 102, 45, 56,
// ];
pub fn header_0() -> [Field; 45] {
    "content-type: application/json; charset=utf-8".as_bytes().map(|x| x as Field)
}

// [
//   99, 111, 110, 116, 101, 110, 116, 45, 101, 110, 99, 111, 100, 105, 110, 103,
//   58, 32, 103, 122, 105, 112,
// ];
pub fn header_1() -> [Field; 22] {
    "content-encoding: gzip".as_bytes().map(|x| x as Field)
}

pub fn header_2() -> [Field; 26] {
    "Transfer-Encoding: chunked".as_bytes().map(|x| x as Field)
}

// {
//   "data": {
//       "items": [
//           {
//               "data": "Artist",
//               "profile": {
//                "name": "Taylor Swift"
//               }
//           }
//       ]
//   }
// }
pub fn body() -> [u8; 202] {
    [
        123, 13, 10, 32, 32, 32, 34, 100, 97, 116, 97, 34, 58, 32, 123, 13, 10, 32, 32, 32, 32,
        32, 32, 32, 34, 105, 116, 101, 109, 115, 34, 58, 32, 91, 13, 10, 32, 32, 32, 32, 32, 32,
        32, 32, 32, 32, 32, 123, 13, 10, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
        32, 34, 100, 97, 116, 97, 34, 58, 32, 34, 65, 114, 116, 105, 115, 116, 34, 44, 13, 10,
        32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 34, 112, 114, 111, 102, 105,
        108, 101, 34, 58, 32, 123, 13, 10, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
        32, 32, 32, 34, 110, 97, 109, 101, 34, 58, 32, 34, 84, 97, 121, 108, 111, 114, 32, 83,
        119, 105, 102, 116, 34, 13, 10, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
        32, 125, 13, 10, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 125, 13, 10, 32, 32, 32,
        32, 32, 32, 32, 93, 13, 10, 32, 32, 32, 125, 13, 10, 125,
    ]
}